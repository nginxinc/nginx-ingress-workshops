# Lab 3: Deploy NGINX Plus Ingress Controller to EKS cluster


## Install NGINX Plus Ingress Controller using Manifest files
- Clone the Ingress Controller repo and navigate into the deployments folder to make it your working directory:
   ```bash
   git clone https://github.com/nginxinc/kubernetes-ingress.git --branch v3.1.0
   cd kubernetes-ingress/deployments
   ```

- Configure RBAC(Role based access control) resources:
  1. Create a namespace and a service account for the Ingress Controller
     ```bash
     kubectl apply -f common/ns-and-sa.yaml
     ```
  2. Create a cluster role and cluster role binding for the service account
     ```bash
     kubectl apply -f rbac/rbac.yaml
     ```

- Create Common Resources:
  1. **(NOTE:Check with Chris if this step can be ignored)** Create a secret with TLS certificate and a key for the default server in NGINX.
     ```bash
      cd ..
      kubectl apply -f examples/shared-examples/default-server-secret/default-server-secret.yaml
      cd deployments
     ```
  2. Create a config map for customizing NGINX configuration.
     ```bash
     kubectl apply -f common/nginx-config.yaml
     ```
  3. Create an IngressClass resource. (**Note:** If you would like to set the NGINX Ingress Controller as the default one, uncomment the annotation `ingressclass.kubernetes.io/is-default-class` within the below file)
     ```bash
     kubectl apply -f common/ingress-class.yaml
     ```

- Create Custom Resources
  1. Create custom resource definitions for VirtualServer and VirtualServerRoute, TransportServer and Policy resources:
     ```bash
     kubectl apply -f common/crds/k8s.nginx.org_virtualservers.yaml
     kubectl apply -f common/crds/k8s.nginx.org_virtualserverroutes.yaml
     kubectl apply -f common/crds/k8s.nginx.org_transportservers.yaml
     kubectl apply -f common/crds/k8s.nginx.org_policies.yaml
     ```
   
   2. **(NOTE:Check with Chris if this step can be ignored)** Create a custom resource for GlobalConfiguration resource:
      ```bash
      kubectl apply -f common/crds/k8s.nginx.org_globalconfigurations.yaml
      ```

- Deploy the Ingress Controller
  
   This section will deploy the Ingress Controller as a Deployment:

   The sample deployment file(`nginx-plus-ingress.yaml`) can be found within `deployment` sub-directory within your present working directory.

   Highlighted below are some of the parameters that would be changed in the sample nginx-plus-ingress.yaml file.

   - Change Image Pull to Private Repo
   - Enable Prometheus
   - Add port and name for dashboard
   - Change Dashboard Port to 9000
   - Allow all IPs to access dashboard
  
  Navigate to AWS/labs directory 
  ```bash
   cd ../../AWS/labs
  ```
  
  Observe the `lab3/nginx-plus-ingress.yaml` looking at below details:
  - On line #40, we have replaced the `nginx-plus-ingress:3.1.0` placeholder with a workshop image that we pushed in the private ECR registry.
  - On lines #54-55, we have added TCP port 9000 for the Plus Dashboard.
  - On lines #98-99, we have enabled the Dashboard and set the IP access controls to the Dashboard.
  - On line #108, we have enabled Prometheus to collect metrics from the NginxPlus stats API.
  - On lines #16-19, we have enabled Prometheus related annotations.


   Now deploy NGINX Plus Ingress Controller as a Deployment using the updated manifest file.
   ```bash
   kubectl apply -f lab3/nginx-plus-ingress.yaml
   ```

## Check your Ingress Controller

1. Verify the NGINX Plus Ingress controller is up and running correctly in the Kubernetes cluster:

   ```bash
   kubectl get pods -n nginx-ingress
   ```

   ```bash
   # Should look similar to this...
   NAME                            READY   STATUS    RESTARTS   AGE
   nginx-ingress-55c78c65d7-7n5bc   1/1     Running   0          17s
   ```

   **Note**: You must use the `kubectl` "`-n`", namespace switch, followed by namespace name, to see pods that are not in the default namespace.

1. Instead of remembering the unique pod name, `nginx-ingress-xxxxxx-yyyyy`, we can store the Ingress Controller pod name into the `$NIC` variable to be used throughout the lab.

   **Note:** This variable is stored for the duration of the terminal session, and so if you close the terminal it will be lost. At any time you can refer back to this step to save the `$NIC` variable again.

   ```bash
   export NIC=$(kubectl get pods -n nginx-ingress -o jsonpath='{.items[0].metadata.name}')
   ```

   Verify the variable is set correctly.
   ```bash
   echo $NIC
   ```
   **Note:** If this command doesn't show the name of the pod then run the previous command again.


## Check the NIC Plus Dashboard

1. Using Kubernetes [port-forwarding](https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/), see if the dashboard is running on port `9000`. Using the VScode terminal pane, run the following `kubectl port-forward` command:

   ```bash
   kubectl port-forward -n nginx-ingress $NIC 9000:9000
   ```

1. Now open Chrome web browser to view the NGINX Plus Dashboard, at [http://localhost:9000/dashboard.html](http://localhost:9000/dashboard.html). 
   
   Do you see the NGINX Plus Dashboard? If so, your Ingress Controller pod is up and running!

   ![NPlus Dashboard](./media/NplusDashboard-port-forward.png)

   **Question - Why is there almost nothing else to see?**  

   <details><summary>Click for Hints!</summary>
   <br/>
   <p>
   <strong>Answer</strong> – you have not configured the Ingress Controller to handle any traffic yet, but you will in the next Lab.
   </p>
   </details>
   </br>

2. Close Chrome Web Browser, and hit `Control-C` in the terminal to stop the Port Forward.

   ![stop port-forward](media/port-forward-ctrl-c.png)

## Take a look "under the hood" of Ingress Controller

The NGINX Ingress Controller is a pod running NGINX Plus under the hood, let's go check it out.

1. Use the VScode Terminal to enter a shell in the NGINX Ingress Controller pod by running the [`kubectl exec`](https://kubernetes.io/docs/tasks/debug-application-cluster/get-shell-running-container/) command 

   ```bash
   kubectl exec -it $NIC -n nginx-ingress -- /bin/bash
   ```

2. Once inside a shell in the NGINX Ingress Controller pod, run the following commands to inspect the root NGINX configuration:

   ```bash
   cd /etc/nginx
   more nginx.conf
   ```

   If you have worked with NGINX config files, it should look very similar!

3. Type `q ` to quit viewing the `nginx.conf `

   ![q to quit more](media/more-command-q-quit.png)

4. Type `exit` to close the connection to the Ingress pod.

   ![exit-to-exit-pod](media/exit-to-exit-pod.png)

This completes this Lab.

## References
- [Installation with Manifests](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/)


### Authors
- Chris Akker - Solutions Architect - Community and Alliances @ F5, Inc.
- Shouvik Dutta - Solutions Architect - Community and Alliances @ F5, Inc.

-------------
Navigate to ([Lab4](../lab4/readme.md) | [Main Menu](../LabGuide.md))