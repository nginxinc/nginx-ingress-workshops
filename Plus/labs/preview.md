![NGINX logo](media/nginx-2020.png)

## Preview:  Here is a list of some additional workshops/labs being developed.

## NGINX Ingress controller deployments using helm, operators

- use `helm` or `operator` for you NIC deployment. Learn how to customize your deployment.

## Advanced use cases for NIC with NGINX NJS (NGINX JavaScript)

- NGINX NJS is built by NGINX. It further extends the function and capability of layer 7 routing with NGINX, providing advanced customized routing capability.  
This workshop will show you how you can do advanced routing use cases using NJS, giving you more power and control of your NGINX Ingress Controller.

- extra specific header values from a incoming request, pass the request to NJS for inspection and then based on a certain value, do the following....

## Advanced layer 7 routing using VirtualServer and VirtualServerRoutes

VirtualServer and VirtualServerRoute are custom resources used by NGINX Ingress controller. They allow for much more advanced use cases, including:

- cross-namespace routing
- match conditions routing (based on a POST or a GET, you can route to a specific application)
- advanced health checking capabilities. This goes beyond standard passive health checks, including remembering `state` of the applications

## Use of NGINX Ingress policies 

NGINX Ingress policies take advantage of our custom resources (virtualServer,virtualServer, transportServer) further increasing your capabilities with NGINX Ingress controller:
  
- rate-limiting -- for your APIs, for a specific application or clusterwide scenarios.
- ingressMTLS
- egressMTLS
- OIDC authentication. Authenticate to providers like Okta.
- JWT tokens

## Layer 4 Load balancing with NGINX Ingress -- TransportServer

NGINX Ingress controller also allows you to load balance your Layer 4 applications.
  
- Layer 4 load balancer (TCP, UDP)
- TLS Passthrough

## NGINX Ingress Controller design -- things to think about with your NGINX Ingress deployment

Learn how to plan and design your cluster for multiple tentants and teams. How do you take advantage of NGINX Ingress controller features to provide tenants or teams their own "sandbox" setup without imnpacting other tenants or teams.

- namespace design -- how to setup a multi-tenant cluster and isolate different teams and tenats, without disturbing other teams/tenants.
- ingressclass -- in depth discussion. how to leverage ingressclass for multiple, isolated ingress controllers

## Monitoring NGINX Ingress controller -- custom Grafana, Prometheus

- This workshop will setting up tools to help you monitor your NGINX Ingress Controller.
- How to configure Prometheus and scrape your NGINX Ingress controller metrics
- Setting up a Grafana dashboard for NGINX Ingress Controller

### Authors
- Jason Williams - Principle Product Management Engineer @ F5, Inc.
- Chris Akker - Solutions Architect - Community and Alliances @ F5, Inc.
- Shouvik Dutta - Technical Solutions Architect @ F5, Inc.

-------------

This completes the Preview.<br/> 
Navigate [Main Menu](LabGuide.md)
