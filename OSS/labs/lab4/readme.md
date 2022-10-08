## Lab 4: NGINX Stub Status access

## Introduction

In this section, you are going to use the NGINX Stub Status to monitor the NGINX Ingress Controller. This is a standard NGINX feature to allow you to watch basic stats and triage any potential issues with the NGINX Ingress controller.

<br/>

## Learning Objectives

- Deploy the NGINX Stub Status
- Test access to the Status Page
- Preview the NGINX Plus Dashboard

<br/>

### Deploy the NGINX Stub Service

We will deploy a `Service` and a `VirtualServer` resource to provide external access to the NGINX Stub Status for statistics.  NGINX Ingress [`VirtualServer`](https://docs.nginx.com/nginx-ingress-controller/configuration/virtualserver-and-virtualserverroute-resources/) is a [Custom Resource Definition (CRD)](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/) used by NGINX to configure NGINX Server and Location blocks for NGINX configurations.


1. In the `lab4` folder, inspect the `stubstatus-vs.yaml` file.  You will see the hostname `dashboard.example.com` has been chosen, and we are routing requests to `/stub_status.html` on port 9000.  Use this YAML file and kubectl to deploy a `Service` and a `VirtualServer` resource to provide access to the NGINX status page for live monitoring:

    ```bash
    kubectl apply -f lab4/stubstatus-vs.yaml
    ```

## Test access to the Status Page

1. Open a new Chrome web browser tab, and click the `Nginx Status` Bookmark, or directly open http://dashboard.example.com/stub_status.html
    
 ![StubStatus](media/lab4_stubstatus.png)
    
You should see the same NGINX Status webpage as the `kubectl port-forward` test we did previously. Using the VirtualServer and Service definitions, your status page is now exposed `outside` of your cluster at http://dashboard.example.com/stub_status.html.  

> **_Recommended:_** Leave this Status Window open for the rest of the Workshop, you will refer to it often during later exercises.

Congratulations! You have successfully configured your Ingress Controller for external access to the NGINX Status page.  Next we will deploy some demo applications and start routing some traffic through NGINX Ingress.

<br/>

For a preview of the NGINX Plus Dashboard, it can be found at https://demo.nginx.com.

It contains a rich set of additional metrics for NGINX Plus and the Ingress Controller.  If you wish to see it in action, check out the `Plus` folder in this repo.

<br/>

**This completes this Lab.**

## References:

- [NGINX Stub Status Monitoring](https://docs.nginx.com/nginx-ingress-controller/logging-and-monitoring/status-page/)

- [NGINX Stub Status Module](https://nginx.org/en/docs/http/ngx_http_stub_status_module.html)


### Authors
- Chris Akker - Solutions Architect - Community and Alliances @ F5, Inc.
- Shouvik Dutta - Technical Solutions Architect @ F5, Inc.

-------------

Navigate to ([Lab5](../lab5/readme.md) | [Main Menu](../LabGuide.md))

