![NGINX NIC Workshop](media/nicossworkshop-banner.png)

# NGINX Ingress Controller Workshop

<br/>

## Welcome!

<br/>

> ><strong>Welcome to the NGINX OSS Workshop for NGINX Ingress Controller (NIC)!</strong>

<br/>

This Workshop will introduce NGINX OSS Ingress Controller with hands-on practice through self-paced lab exercises.

You will learn how to configure an **`NGINX OSS Ingress Controller`**, deploy it on a Kubernetes cluster, configure basic and advanced NGINX features, load test it, scale it up and down and monitor it in real time.  You will deploy new Apps and Services in your own private cluster, terminate TLS, route HTTP traffic; configure re-directs, sorry pages, load balance algorithms, caching, Blue/Green testing and routing traffic to running pods.

<br/>

But Wait - I'm already running NGINX, aren't I ?  NGINX OSS Ingress is not the default Ingress, the Community Ingress is the default.  Are you running `kubernetes/ingress-nginx`, or `nginxinc/nginx-ingress` - there **IS** a difference!

Here is a side by side comparison for NGINX Ingress vs Community Ingress:

<br/>

NGINX Version  |  K8s Community Version
:-------------------------:|:-------------------------:
nginxinc/kubernetes-ingress | kubernetes/ingress-nginx
NGINX Open Source | Kubernetes Open Source
Written in "C" | NGINX Build with Custom LUA
Small Footprint | Large Footprint
Extended with CRDs | Limited to Ingress Type
NGINX Support | Community Support
Commercial Option | No Commercial Option
![](media/nginx-ingress-icon.png)  |  ![](media/kubernetes-icon.png)

<br/>

For further details, read the blogs on Nginx.com:

- https://www.nginx.com/blog/guide-to-choosing-ingress-controller-part-3-open-source-default-commercial/

- https://www.nginx.com/blog/guide-to-choosing-ingress-controller-part-4-nginx-ingress-controller-options

<br/>

These Hands-On Lab Exercises are designed to build upon each other, adding additional services and features as you progress through them, completing the labs in sequential order is required. 

![Developer Seated](media/developer-seated.svg)

By the end of this Workshop, you will have a working, operational NGINX Ingress Controller, routing traffic to and from Kubernetes application pods and services, with the necessary skills to deploy and operate NIC for your own Modern Applications running in Kubernetes.  Thank You for taking the time to attend this NGINX Workshop!

![Robot](media/robot.svg)

## About NGINX Ingress Controller

NGINX Ingress Controller is an Open Source resource for directing traffic to/from a Kubernetes Cluster.  NGINX runs all popular K8s platforms, including Amazon EKS, Google GKE, Azure AKS, Rancher, Digital Ocean, Openshift, and many others.  It can also work with your on-premise Data Center based Kubernetes clusters.  NGINX Ingress Controller is built from the same source code you know and trust from NGINX.  You can find the full Kubernetes support matrix and technical specifications for NGINX Ingress Controller on the http://www.nginx.org website.  

<br/>

![NGINX Ingress Controller topology](media/nic-topology.svg)

<br/>

NGINX Ingress Controller has the best-in-class traffic management solution for cloud‑native apps in Kubernetes and containerized environments. In a recent 
[CNCF](https://www.cncf.io/blog/2018/08/29/cncf-survey-use-of-cloud-native-technologies-in-production-has-grown-over-200-percent/)
survey, nearly two‑thirds of respondents reported using the NGINX Ingress Controller, more than all other controllers combined – and NGINX Ingress Controller has been downloaded more than [50 million
times](https://hub.docker.com/r/nginx/nginx-ingress) on DockerHub. 

<br/>

![NGINX NIC](media/nginx-2020.png)

<br/>

Combining the speed and performance of NGINX with the trust and security behind F5 Networks, NGINX Ingress Controller is synonymous with high‑performance, scalable, and secure modern apps in development, testing, QA, and staging.

https://docs.nginx.com/nginx-ingress-controller/intro/how-nginx-ingress-controller-works/

https://docs.nginx.com/nginx-ingress-controller/technical-specifications/

<br/>

### Authors

- Chris Akker - Solutions Architect - Community and Alliances @ F5, Inc.
- Shouvik Dutta - Solutions Architect - Sales @ F5, Inc.
- Jason Williams - Principle Product Management Engineer @ F5, Inc.

-------------

This completes the Introduction.
<br/> 
Click on ([LabGuide](LabGuide.md)) to begin the workshop.
