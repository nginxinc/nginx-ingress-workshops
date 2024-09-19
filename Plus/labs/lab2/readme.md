# Lab 2: Verify NGINX Plus Ingress Controller is running

## Introduction

The NGINX Ingress Controller is already running in this workshop. You will be checking and verifying the Ingress Controller is running.

## Learning Objectives

- Intro to NGINX Ingress Controller
- Intro to Kubernetes environment, interacting with `kubectl` command
- Access the NGINX Plus Dashboard

## Check your Ingress Controller

1. First, verify the NGINX Ingress controller is up and running correctly in the Kubernetes cluster:

   ```bash
   kubectl get pods -n nginx-ingress
   ```

   ```bash
   ###Sample output###
   NAME                            READY   STATUS    RESTARTS   AGE
   nginx-ingress-fd4b9f484-t5pb6   1/1     Running   1          12h
   ```

   **Note**: You must use the `kubectl` "`-n`", namespace switch, followed by namespace name, to see pods that are not in the default namespace.

1. Instead of remembering the unique pod name, `nginx-ingress-xxxxxx-yyyyy`, we can store the Ingress Controller pod name into the `$NIC` variable to be used throughout the lab.

   **Note:** This variable is stored for the duration of the terminal session, and so if you close the terminal it will be lost. At any time you can refer back to this step to save the`$NIC` variable again.

   ```bash
   export NIC=$(kubectl get pods -n nginx-ingress -o jsonpath='{.items[0].metadata.name}')
   ```

   Verify the variable is set correctly.

   ```bash
   echo $NIC
   ```

   **Note:** If this command doesn't show the name of the pod then run the previous command again.

## Inspect the details of your Ingress Controller:

1. Inspect the details of the NGINX Ingress Controller pod using the `kubectl describe` command

   ```bash
   kubectl describe pod $NIC -n nginx-ingress
   ```

   **Note:** The IP address and TCP ports that are open on the Ingress (they should match the `lab2/nginx-plus-ingress.yaml` file, around lines `24-34`). We have the following Ports:

   - Port `80 and 443` for web/ssl traffic,
   - Port `8081` for Readiness Probe, 
   - Port `9000` for the Dashboard, and 
   - Port `9113` for Prometheus (You will see this in a later Lab)

   ![kubectl describe](media/kubectl_describe.png)

## Check the NIC Plus Dashboard

1. Using Kubernetes [port-forwarding](https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/), see if the dashboard is running on port `9000`. Using the VScode terminal pane, run the following `kubectl port-forward` command:

   ```bash
   kubectl port-forward -n nginx-ingress $NIC 9000:9000
   ```

1. Now open Chrome web browser to view the NGINX Plus Dashboard, at [http://localhost:9000/dashboard.html](http://localhost:9000/dashboard.html).

   Do you see the NGINX Plus Dashboard? If so, your Ingress Controller pod is up and running!

   ![NPlus Dashboard](media/lab2_NplusDashboard.png)

   **Question - Why is there almost nothing else to see?**  

   <details><summary>Click for Hints!</summary>
   <br/>
   <p>
   <strong>Answer</strong> – you have not configured the Ingress Controller to handle any traffic yet, but you will in the next Lab.
   </p>
   </details>
   </br>

1. Close Chrome Web Browser, and hit `Control-C` in the terminal to stop the Port Forward.

   ![stop port-forward](media/port-forward-ctrl-c.png)

### Take a look "under the hood" of Ingress Controller

The NGINX Ingress Controller is a pod running NGINX Plus under the hood, let's go check it out.

1. Use the VScode Terminal to enter a shell in the NGINX Ingress Controller pod by running the [`kubectl exec`](https://kubernetes.io/docs/tasks/debug-application-cluster/get-shell-running-container/) command

   ```bash
   kubectl exec -it $NIC -n nginx-ingress -- /bin/bash
   ```

1. Once inside a shell in the NGINX Ingress Controller pod, run the following commands to inspect the root NGINX configuration:

   ```bash
   cd /etc/nginx
   more nginx.conf
   ```

   If you have worked with NGINX config files, it should look very similar!

1. Type `q` to quit viewing the `nginx.conf`

   ![q to quit more](media/more-command-q-quit.png)

1. Type `exit` to close the connection to the Ingress pod.

   ![exit-to-exit-pod](media/exit-to-exit-pod.png)

**This completes this Lab.**

## References:

- https://docs.nginx.com/nginx-ingress-controller
- https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/

### Authors

- Chris Akker - Solutions Architect - Community and Alliances @ F5, Inc.
- Shouvik Dutta - Solutions Architect - Community and Alliances @ F5, Inc.

-------------
Navigate to ([Lab3](../lab3/readme.md) | [Main Menu](../LabGuide.md))
