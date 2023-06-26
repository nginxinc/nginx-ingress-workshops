MY_REGION=us-east-1
MY_EKS=eks-shouvik-useast1
MY_AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)
MY_IAM_POLICY_NAME=AWSLoadBalancerControllerIAMPolicy
MY_IAM_SA=aws-load-balancer-controller

kubectl delete -f loadbalancer-aws-elb.yaml

helm uninstall aws-load-balancer-controller -n kube-system 

helm repo remove eks

eksctl delete iamserviceaccount \
   --cluster=${MY_EKS} \
   --namespace=kube-system \
   --name=${MY_IAM_SA}

echo "NOTE: Sleeping for 20 secs so that service account gets deleted before deleting IAM policy"
sleep 20

aws iam delete-policy \
   --policy-arn arn:aws:iam::${MY_AWS_ACCOUNT_ID}:policy/${MY_IAM_POLICY_NAME}