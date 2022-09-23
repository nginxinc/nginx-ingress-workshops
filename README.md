
# nginx_ingress_workshops

This Repo is for the Nginx Ingress Controller Workshops.
These are Hands on Labs Exercises.

<br>

Use the folder that matches your hosted Lab environment.

- Plus - This is run as a UDF Class, hosted by F5 / Nginx employees.
- OSS -  This is run as a UDF Class, hosted by F5 / Nginx employees.

## Requirements

These Workshops are hosted on various lab environments.  The basic requirements for a person to complete the Hands on Lab Exercises are as follows:

- A kubernetes cluster - does not really matter which one, as long as it is relatively current.
- Admin access to the cluster.
- Nginx Ingress Controller software - you can use Nginx OSS for the OSS labs.  You can use NginxPlus for the Plus labs.  If you need a license for NginxPlus, you can access a 30-day free trial here:  < url >
- A laptop or other computer to use as a client to the Lab environment.  Different environments have different client requirements, so read the "Client PC" requirements in the Lab Overview.

## Installation

The lab environment is pre-built with all the components needed to complete the Lab Exercises.  If you would like to run these lab exercises in your own k8s cluster environment, you will need to provide the following resources in your own test lab environment:

- working k8s cluster, three node is probably the minimum size.
- access to a private container registry, where container images can be stored and pulled.
- an Nginx Ingress Controller image.  You can use the OSS image, or provide one with Plus from your build location, as describe here: https://docs.nginx.com/nginx-ingress-controller/installation/pulling-ingress-controller-image/.
- a client PC to use for access to the cluster
- A load balancer service running to expose your cluster to external traffic.

## Usage

The Lab Exercises and Guides are meant to be self-paced, but can easily be taught by an instructor to create an interactive learning environment.  Feedback about these workshops is valuable to ensure the content is accurate and relevant. 

## Feedback

Read the [`CONTRIBUTING.md`](https://github.com/nginxinc/nginx-ingress-workshops/blob/main/CONTRIBUTING.md) file.

## License

[Apache License, Version 2.0](https://github.com/nginxinc/nginx-ingress-workshops/blob/main/LICENSE)

&copy; [F5 Networks, Inc.](https://www.f5.com/) 2022
