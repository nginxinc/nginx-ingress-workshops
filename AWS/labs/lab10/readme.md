## Lab 10: Deploy JuiceShop application, using VS/VSR manifests ##

In this lab, we deploy a new application, leaving the current Cafe and Bar apps up and running. This new app environment is deployed using NGINX Plus VirtualServer/VSRroute manifests.

<br/>

## Learning Objectives 

By the end of the lab, you will be able to: 

- Create a new Kubernetes namespace
- Deploy and test a new application
- Access this new app thru NGINX Ingress Controller

<br/>

![Juiceshop welcome page](media/lab10_juiceshop_welcome_page.png)

<br/>

You will launch a new application, called `Juice Shop`, representing a modern online retail sales app, a nice refeshing addition to Cafe and Bar. It will be deployed in a new Kubernetes namespace called "juice" in your cluster.  The Juice Shop app is often used to test various HTTP and Website vulnerabilities. However, you will use it to test various NGINX Plus features.

1. Inspect both of the Lab10 Juiceshop YAML files, `juiceshop.yaml`, and `juiceshop-vs.yaml`.  Do you see the deployment, service, and virtual server and route definitions?  

2. Next deploy the JuiceShop namespace, application using these manifests:

    ```bash
    kubectl create namespace juice
    ```
    ```bash
    ###Sample Output###
    namespace/juice created
    ```
    <br/>

    ```bash
    kubectl apply -f lab10/juiceshop.yaml
    kubectl apply -f lab10/juiceshop-vs.yaml
    ```
    ```bash
    ###Sample Output###
    deployment.apps/juiceshop created
    service/juiceshop-svc created
    secret/juice-secret created
    virtualserver.k8s.nginx.org/juiceshop-vs created
    ```

3. Show running Juice components:

    ```bash
    kubectl get pods,svc,vs -n juice -o wide
    ```
    ```bash
    ###Sample Output###
    NAME                             READY   STATUS    RESTARTS   AGE    IP               NODE                             NOMINATED NODE   READINESS GATES
    pod/juiceshop-55bb4899cf-h4vpj   1/1     Running   0          2m2s   192.168.44.93    ip-192-168-46-102.ec2.internal   <none>           <none>
    pod/juiceshop-55bb4899cf-m9qg9   1/1     Running   0          2m2s   192.168.35.215   ip-192-168-61-250.ec2.internal   <none>           <none>
    pod/juiceshop-55bb4899cf-r866z   1/1     Running   0          2m2s   192.168.15.52    ip-192-168-12-93.ec2.internal    <none>           <none>

    NAME                    TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE    SELECTOR
    service/juiceshop-svc   ClusterIP   None         <none>        80/TCP    2m3s   app=juiceshop

    NAME                                       STATE   HOST                    IP    EXTERNALHOSTNAME   PORTS   AGE
    virtualserver.k8s.nginx.org/juiceshop-vs   Valid   juiceshop.example.com                                    2m1s
    ```
    <br/>

4. Test the new Juice Shop application and VS/VSR manifests.

    Open Chrome, navigate to (http://juiceshop.example.com).  Click around for a few minutes to explore the application.

    Did you notice, how easy it was with Plus NIC, to launch a completely new application in just a few seconds?  With just 2 YAML manifest files - and `no IT tickets` required to do this?  NGINX NIC can perform the Layer7 Hostname and path routing for many different applications running in your k8s cluster.

    ![Juiceshop welcome page](media/lab10_juiceshop_welcome_page.png)

5. Check the NIC Plus Dashboard, you should see a new JuiceShop HTTP Zone and Upstreams:

    ![NGINX Dashboard HTTP Zones](media/lab10_dashboard_httpzone.png)

    ![NGINX Dashboard Upstreams](media/lab10_dashboard_upstreams.png)

**This completes this Lab.**

<br/>

## References:

- [NGINX VirtualServer / Route](https://docs.nginx.com/nginx-ingress-controller/configuration/virtualserver-and-virtualserverroute-resources/)

- [JuiceShop Demo Source](https://github.com/bkimminich/juice-shop)

### Authors

- Chris Akker - Solutions Architect - Community and Alliances @ F5, Inc.
- Shouvik Dutta - Solutions Architect - Community and Alliances @ F5, Inc.

-------------

Navigate to ([Lab11](../lab11/readme.md) | [Main Menu](../LabGuide.md))
