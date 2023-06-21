# Set relevant variables
MY_REGION=us-east-1
MY_EKS=eks-shouvik-useast1
MY_AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)
MY_IAM_POLICY_NAME=AWSLoadBalancerControllerIAMPolicy
MY_IAM_SA=aws-load-balancer-controller

# Create the IAM policy
aws iam create-policy \
--policy-document file://iam_policy.json \
--policy-name ${MY_IAM_POLICY_NAME}

# Create the k8s Service Account
eksctl create iamserviceaccount \
--cluster=${MY_EKS} \
--namespace=kube-system \
--name=${MY_IAM_SA} \
--attach-policy-arn=arn:aws:iam::${MY_AWS_ACCOUNT_ID}:policy/${MY_IAM_POLICY_NAME} \
--override-existing-serviceaccounts \
--approve \
--region ${MY_REGION}

# Add helm repo
helm repo add eks https://aws.github.io/eks-charts

# Update helm repo
helm repo update

# Install aws-load-balancer-controller using helm chart
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
-n kube-system \
--set clusterName=${MY_EKS} \
--set serviceAccount.create=false \
--set serviceAccount.name=${MY_IAM_SA}

# Scale the deployment to 1 replica count
kubectl scale deploy aws-load-balancer-controller -n kube-system --replicas=1
