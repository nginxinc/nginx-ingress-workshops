# Lab 2: Pulling NGINX Ingress Controller Image using Docker and pushing to private Repo:

- First you need to configure the Docker environment to use certificate-based client-server authentication with F5 private container registry `private-registry.nginx.com`.
- To do so create a `private-registry.nginx.com` directory under below paths based on your operating system. (See references section for more details)
  -  **linux** : `/etc/docker/certs.d`
  -  **mac** : `~/.docker/certs.d`
  -  **windows** : `~/.docker/certs.d` 
  
  
- Copy nginx-repo.crt and nginx-repo.key file in the newly created directory.
  -  Below are the commands for mac
     ```bash
     mkdir ~/.docker/certs.d/private-registry.nginx.com
     cp nginx-repo.crt ~/.docker/certs.d/private-registry.nginx.com/client.cert
     cp nginx-repo.key ~/.docker/certs.d/private-registry.nginx.com/client.key
     ```
- Optional Step only for Mac and Windows system
  - Restart Docker Desktop so that it copies the `~/.docker/certs.d` directory from your Mac or Windows system to the `/etc/docker/certs.d` directory on **Moby** (the Docker Desktop `xhyve` virtual machine).


- Run below command to pull the NGINX Plus Ingress Controller image from F5 private container registry.
  ```bash
  docker pull private-registry.nginx.com/nginx-ic/nginx-plus-ingress:3.1.0
  ```
  **NOTE:** At the time of this writing 3.1.0 is the latest NGINX Ingress version that is available. Please feel free to use the latest version of NGINX Plus Ingress Controller. Look into references for latest Docker images.

- Set below variables to tag and push image to AWS ECR
  ```bash
  MY_AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query 'Account' --output text)
  MY_REGION=us-east-1
  MY_REPO=shouvik/nginx-plus-ingress
  MY_TAG=3.1.0
  MY_REGISTRY=$MY_AWS_ACCOUNT_ID.dkr.ecr.$MY_REGION.amazonaws.com 
  ```

- Check all variables have been set properly by running below command:
  ```bash
  set | grep MY_
  ```

- After setting the variables, tag the image using below command
  ```bash
   docker tag private-registry.nginx.com/nginx-ic/nginx-plus-ingress:$MY_TAG $MY_REGISTRY/$MY_REPO:$MY_TAG
  ```

- Now login to AWS ECR by using below command
  ```bash
  aws ecr get-login-password --region $MY_REGION | docker login --username AWS --password-stdin $MY_REGISTRY
  ```
- After running the above command you should receive "**Login Succeeded**" message validating docker login was successful.

- First we will create the repository within ECR by running below command (**NOTE:** This step needs to be performed only if you donot have a repository in your ECR. Ignore this step if you are just pushing a new build/tag to the same repository)
  ```bash
  aws ecr create-repository --repository-name $MY_REPO --region $MY_REGION
  ```

- Now we will push the NIC image using below command
  ```bash
  docker push $MY_REGISTRY/$MY_REPO:$MY_TAG
  ```

- Once pushed you can check the image by running below command
  ```bash
  aws ecr describe-repositories --region $MY_REGION | grep $MY_REPO
  ```
- Congrats the image has been added to your private ECR repository.


This completes this Lab.

## References
- [Pulling Ingress Controller Image](https://docs.nginx.com/nginx-ingress-controller/installation/pulling-ingress-controller-image)
- [Add Client Certificate Mac](https://docs.docker.com/desktop/faqs/macfaqs/#add-client-certificates)
- [Add Client Certificate Windows](https://docs.docker.com/desktop/faqs/windowsfaqs/#how-do-i-add-client-certificates)
- [Docker Engine Security Documentation](https://docs.docker.com/engine/security/certificates/)
- [Latest NGINX Plus Ingress Images](https://docs.nginx.com/nginx-ingress-controller/technical-specifications/#images-with-nginx-plus)


### Authors
- Shouvik Dutta - Solutions Architect - Community and Alliances @ F5, Inc.

-------------
Navigate to ([Lab3](../lab3/readme.md) | [Main Menu](../LabGuide.md))