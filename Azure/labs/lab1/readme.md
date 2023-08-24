# Lab 1: Deploying NIC to AKS cluster

<br/>

## Introduction

In this section, you will ...
<br/>

## Learning Objectives
- one
- two 

## Pulling NGINX Plus Ingress Controller Image using Docker and pushing to private ACR Registry

1. First you need to configure the Docker environment to use certificate-based client-server authentication with F5 private container registry `private-registry.nginx.com`.<br/>
To do so create a `private-registry.nginx.com` directory under below paths based on your operating system. (See references section for more details)
     -  **linux** : `/etc/docker/certs.d`
     -  **mac** : `~/.docker/certs.d`
     -  **windows** : `~/.docker/certs.d` 


1. Copy `nginx-repo.crt` and `nginx-repo.key` file in the newly created directory.
     -  Below are the commands for mac/windows based systems
        ```bash
        mkdir ~/.docker/certs.d/private-registry.nginx.com
        cp nginx-repo.crt ~/.docker/certs.d/private-registry.nginx.com/client.cert
        cp nginx-repo.key ~/.docker/certs.d/private-registry.nginx.com/client.key
        ```  

1. ***Optional** Step only for Mac and Windows system
     - Restart Docker Desktop so that it copies the `~/.docker/certs.d` directory from your Mac or Windows system to the `/etc/docker/certs.d` directory on **Moby** (the Docker Desktop `xhyve` virtual machine).

1. Once Docker Desktop has restarted, run below command to pull the NGINX Plus Ingress Controller image from F5 private container registry.
    ```bash
    docker pull private-registry.nginx.com/nginx-ic/nginx-plus-ingress:3.2.1
    ```
    **Note**: At the time of this writing 3.2.1 is the latest NGINX Plus Ingress version that is available. Please feel free to use the latest version of NGINX Plus Ingress Controller. Look into references for latest Ingress images.

1. Set below variables to tag and push image to AWS ECR
    ```bash
    MY_ACR=acrshouvik
    MY_REPO=nginxinc/nginx-plus-ingress
    MY_TAG=3.2.1
    MY_IMAGE_ID=$(docker images private-registry.nginx.com/nginx-ic/nginx-plus-ingress:$MY_TAG --format "{{.ID}}") 
    ```
    Check all variables have been set properly by running below command:
    ```bash
    set | grep MY_
    ```

1. After setting the variables, tag the pulled NGINX Plus Ingress image using below command
    ```bash
    docker tag $MY_IMAGE_ID $MY_ACR.azurecr.io/$MY_REPO:$MY_TAG
    ```
1. Login to the ACR registry using below command. 
   ```bash
   az acr login --name $MY_ACR
   ```

1. Push your tagged image to ACR registry
   ```bash
   docker push $MY_ACR.azurecr.io/$MY_REPO:$MY_TAG
   ```

1. Once pushed you can check the image by running below command
    ```bash
    az acr repository list --name $MY_ACR --output table
    ```
    
**This completes the Lab.** 
<br/>

## References: 

- [Pulling NGINX Plus Ingress Controller Image](https://docs.nginx.com/nginx-ingress-controller/installation/pulling-ingress-controller-image)
- [Add Client Certificate Mac](https://docs.docker.com/desktop/faqs/macfaqs/#add-client-certificates)
- [Add Client Certificate Windows](https://docs.docker.com/desktop/faqs/windowsfaqs/#how-do-i-add-client-certificates)
- [Docker Engine Security Documentation](https://docs.docker.com/engine/security/certificates/)
- [Latest NGINX Plus Ingress Images](https://docs.nginx.com/nginx-ingress-controller/technical-specifications/#images-with-nginx-plus)
<br/>

### Authors
- Chris Akker - Solutions Architect - Community and Alliances @ F5, Inc.
- Shouvik Dutta - Solutions Architect - Community and Alliances @ F5, Inc.
- Jason Williams - Principle Product Management Engineer @ F5, Inc.

-------------

Navigate to ([Lab1](../lab1/readme.md) | [Main Menu](../LabGuide.md))
