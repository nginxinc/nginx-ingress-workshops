[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Community Support](https://badgen.net/badge/support/community/cyan?icon=awesome)](https://github.com/nginxinc//nginx-ingress-workshops/blob/main/SUPPORT.md)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](https://github.com/nginxinc//nginx-ingress-workshops/blob/main/CODE_OF_CONDUCT.md)

![NGINX Ingress Workshop](media/nginx-ingress-workshop-banner.png)

<br>

# Welcome to the Workshops for NGINX Ingress Controller!

<br/>

This Repo is for learning `NGINX Ingress Controller`, with Hands-on Lab Exercises and Lab Guides that will teach a student using real world scenarios for using NGINX Ingress Controller in a Kubernetes Cluster.

<br>

![NGINX Ingress Controller topology](media/nic-topology.svg)

<br/>

## Audience

These Workshops are meant for Modern Application Developers, Architects, DevOps, Platform Ops, and SRE engineers working with Kubernetes and Ingress Controllers, to learn and understand how NGINX Ingress Controller works - is configured, deployed, monitored and managed.

The Student taking these Workshops should have basic and/or intermediate skills and knowledge with:

- Kubernetes Administration
- NGINX webserver and NGINX Proxy
- HTTP and TLS protocols and traffic
- Chrome or browser diagnostic tools
- Basic Linux OS commands and OS tools
- Basic container / Docker administration
- Visual Studio Code

`Advanced Workshops will required additional knowledge and skills.`

<br>

## Student and Environment Requirements

</br>

NGINX Ingress  |  Hands-On Labs
:-------------------------:|:-------------------------:
![](media/nginx-ingress-icon.png)  |  ![](media/developer-seated.svg)

<br/>

The Lab Exercises and Lab Guides are written for a `specific Kubernetes environment`.  Choose the folder that matches your hosted Lab environment, and use the resources in that folder.

- OSS -  This environment is built in F5's Unified Demo Framework (UDF), and is hosted as a class instructed by F5/NGINX employees.

- Plus - This environment is built in F5's Unified Demo Framework (UDF), and is hosted as a class instructed by F5/NGINX employees.

- Rancher - This environment would be built using a Rancher RKE2 cluster, and would be provided by the Student.

- AWS - This environment would be built using an Amazon EKS cluster, and would be provided by the Student.

- GCP - This environment would be built using a Google GKE cluster, and would be provided by the Student.

- Azure - This environment would be built using an Azure AKS cluster, and would be provided by the Student.

- Minikube - This environment would be built using a MacOS minikube cluster, and would be provided by the Student.

It is important to select the proper environment and folder, as the initial setup and configuration of the clusters, repository, ingress controllers, load balancer services, and remote access instructions will differ among the environments.  `After the initial setup, most of the lab exercises are nearly identical.`

<br>

NGINX  |  Kubernetes  |  VisualStudio Code
:-------------------------:|:-------------------------:|:-------------------------:
![](media/nginx-icon.png)  |  ![](media/kubernetes-icon.png)   |  ![](media/vs-code-icon.png)

<br/>

The requirements for a Student to complete the Hands-on Lab Exercises are the following:

- A Kubernetes cluster, with Admin level access.
- NGINX Ingress Controller software
- - you will use NGINX Open Source for the OSS labs, found here:  https://hub.docker.com/r/nginx/nginx-ingress  
- - you must use NGINX Plus for the Plus labs.  If you need a license for NGINX Plus, you can request a free 30-day trial here:  https://www.nginx.com/free-trial-request-nginx-ingress-controller/
- A laptop or other computer to use as a client to the Lab environment.
- Time:  Most of the workshops can be completed in 2-3 hours.  

<br>

## Installation

The F5/NGINX hosted UDF lab environments are pre-built with all the components needed to complete the Lab Exercises.  If you would like to run these lab exercises in a different k8s cluster environment, the Student will need to provide the following resources in the test lab environment:

- Working k8s cluster, three node minimum size, with admin level access.
- Access to a private container registry, where container images can be stored and pulled.
- An NGINX Ingress Controller container image.  You can use the OSS image, or provide your own with Plus, as describe here: https://docs.nginx.com/nginx-ingress-controller/installation/pulling-ingress-controller-image/.
- A client PC to use for access to the cluster.
- A LoadBalancer Service running to expose your cluster to external traffic.
- Certain environments may have additional resource requirements.

<br>

<img src="media/robot.svg" width=25% height=25%>

<br>

## Usage

The Lab Exercises and Guides are meant to be self-paced, but can easily be taught by an instructor to create an interactive learning environment.  In order to get the most out of these Labs, it is important to follow the Lab Guides as written, completing the Exercises in the order outlined.  Students are encouraged to ask questions and provide feedback.  Students assume all risk when using this content, per the licensing agreement.

<br>

## Feedback

Provide feedback as described in the [`CONTRIBUTING.md`](https://github.com/nginxinc/nginx-ingress-workshops/blob/main/CONTRIBUTING.md) file.

<br>

## License

[Apache License, Version 2.0](https://github.com/nginxinc/nginx-ingress-workshops/blob/main/LICENSE)

&copy; [F5 Networks, Inc.](https://www.f5.com/) 2022
