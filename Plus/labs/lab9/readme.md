## Lab 9: Deploy JuiceShop application, using VS/VSR manifests ##

In this lab, we deploy a new application, leaving the current Cafe and Bar apps up and running. This new app environment is deployed using NGINX Plus VirtualServer/VSRroute manifests.

<br/>

## Learning Objectives 

By the end of the lab, you will be able to: 

- Create a new Kubernetes namespace
- Deploy and test a new application
- Access this new app thru NGINX Ingress Controller

<br/>

![Juiceshop welcome page](media/lab9_juiceshop_welcome_page.png)

<br/>

You will launch a new application, called `Juice Shop`, representing a modern online retail sales app, a nice refeshing addition to Cafe and Bar. It will be deployed in a new Kubernetes namespace called "juice" in your cluster.  The Juice Shop app is often used to test various HTTP and Website vulnerabilities. However, you will use it to test various NGINX Plus features.

1. Inspect both of the Lab9 Juiceshop YAML files, `juiceshop.yaml`, and `juiceshop-vs.yaml`.  Do you see the deployment, service, and virtual server and route definitions?  

1. Next deploy the JuiceShop namespace, application using these manifests:

    ```bash
    kubectl create namespace juice
    ```
    ![Namespace creation screenshot](media/lab9_namespace.png)

    ```bash
    kubectl apply -f lab9/juiceshop.yaml
    kubectl apply -f lab9/juiceshop-vs.yaml
    ```

    ![Component creation screenshot](media/lab9_component_create.png)

1. Show running Juice components:

    ```bash
    kubectl get pods,svc,vs -n juice -o wide
    ```
    ![Component Get Screenshot](media/lab9_component_get.png)

    <br/>

1. Test the new Juice Shop application and VS/VSR manifests.

    Open Chrome, navigate to (http://juiceshop.example.com).  Click around for a few minutes to explore the application.

    Did you notice, how easy it was with Plus NIC, to launch a completely new application in just a few seconds?  With just 2 YAML manifest files - and `no IT tickets` required to do this?  NGINX NIC can perform the Layer7 Hostname and path routing for many different applications running in your k8s cluster.

    ![Juiceshop welcome page](media/lab9_juiceshop_welcome_page.png)

1. Check the NIC Plus Dashboard, you should see a new JuiceShop HTTP Zone and Upstreams:

    ![NGINX Dashboard HTTP Zones](media/lab9_dashboard_httpzone.png)

    ![NGINX Dashboard Upstreams](media/lab9_dashboard_upstreams.png)

**This completes this Lab.**

<br/>

## References:

- [NGINX VirtualServer / Route](https://docs.nginx.com/nginx-ingress-controller/configuration/virtualserver-and-virtualserverroute-resources/)

- [JuiceShop Demo Source](https://github.com/bkimminich/juice-shop)

### Authors

- Chris Akker - Solutions Architect - Community and Alliances @ F5, Inc.
- Shouvik Dutta - Solutions Architect - Community and Alliances @ F5, Inc.

-------------

Navigate to ([Lab10](../lab10/readme.md) | [Main Menu](../LabGuide.md))
