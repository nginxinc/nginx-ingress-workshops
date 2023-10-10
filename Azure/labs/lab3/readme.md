# Lab 3: Configuring NIC with AzureAD

<br/>

## Introduction

In this section, you will be configuring NGINX Ingress controller with Microsoft Azure Active directory to add authentication to a specific application. You will be adding a `policy` and `client-secret` to the cluster to know how to connect to Microsoft Azure Active Directory.
<br/>

## Learning Objectives

What you will need from Microsoft Azure AD:

- Azure account
- Azure AD setup
- Configure NGINX Ingress controller `policy` with Azure AD
- Request access to `/tea` and verify the redirection and authentication page is presented.
- Verify that after successfully logging into Azure AD, the redirect back to NGINX Ingress controller successfully routes you to `/tea`

You will want to create a new `app registration` from within Azure Active Directory.

Login into Microsoft Azure Portal and navigate to Azure Active Directory.    
1. Click on `app registrations`.
2. CLick the `+` button at the top for `New registration`
3. Fill out the fields and name your application registration.
4. You can ignore `redirect` URI for now. We will configure this later.

![App registration!](./images/app-reg.PNG "App registration")

Take note of the `application (client) ID` as that will be required for setup.
You will need to create a new `client credentials` for the secret that will be used with NIC and Azure AD.

Creating `client secret`
When you create a new app registration, you will also need to create a new `client-secret` that will be used by NGINX Ingress controller. This secret will be used to generate a Kubernetes Secret as part of the workdflow.
To create your `client secret`, fro within the application we registered in the above, `click` into the application itself. Once within the application, on the right side you will see `client credentials`.
When `client credentials` is open, click on the `+` button for `New client secret`.

You will be asked to provide a description of the secret as well as an expiration. Feel in as you see fit.

Once you have created the secert, you will see the secret below. The `value` column wil lbe the value you want to look for and copy. This is what will be used to create our Kubernetes secret for OIDC.

Within the Azure AD portal and app registration screen, create your `client-secret`:

![Client secret!](./images/client-secret.JPG "Client secret")

After you create your `client-secret`, make sure you copy the the `Value` portion of the secret, and use that to create your Kubernetes secret


![Client secret value!](./images/secret-value.jpg "Secret value")

With the secret value copied, we are going to create a kubernetes secret. 

To create our secret, we are going to use the builtin in `base64` to encode our secret. This encoded secret will then be used in our .yaml secret file for OIDC. 

```yaml
echo -n '138cvj3kj43kjkjlkjflks' | base64
MTM4Y3ZqM2tqNDNramtqbGtqZmxrcw==
```

Copy the value on the screen and paste it into your `.yaml` secret like the below.

Here is a sample NGINX Ingress controller `oidc-secret` manifest for reference that you can paste your output from above into:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: oidc-secret
type: nginx.org/oidc
data:
  client-secret: MTM4Y3ZqM2tqNDNramtqbGtqZmxrcw== 
```

The `endpoints` tab will have the information that NGINX Ingress controller needs (authorization endpoint, token endpoint, .well-known/openid-configuration).

![Endpoint information!](./images/endpoit.JPG "Endpoint Information")

You can `curl` the `.well-known/openid-configuration` endpoint to retrieve the `jwksURI` which we will need to configure NGINX Ingress controller.

We are going to be using `OpenID Connect metadata document` to find our `.well-known/openid-configuration`

```shell
curl https://login.microsoftonline.com/<replace_with_your_tenant_id>/v2.0/.well-known/openid-configuration | jq
```

The last piece we need to configure in Azure AD is setting up the `redirect`.
Go to your `app registration` and click on `authentication`.   
Then click `add a platform` followed one of the applications.
On the next screen, you will `redirect URIs` and `Front-channel logout URL`. 


For the `redirect URI`, you will want to fill in with the address of the NGINX Ingress controller instance, including the port number, with `/_codexch`.
For example, if my NGINX Ingress controller is configured for OIDC to access `cafe.example.com`, you would populate the `redirect URI` with the following:

![Redirect URI setup!](./images/redirect.JPG "Redirect configuration")

For this example, my configuration setting would be:

```bash
hhttps://cafe.example.com:443/_codexch
```

Make sur you are specifing `HTTPS` and port 443. This is required setting.

Setting up NGINX Ingress controller

You will need to use our custom resource definitions. This includes our `virtualserver` and our `policy`, both required to use OIDC authentication.

You will need to define a `resolver` so NGINX Ingress can resolve the IdP hostname. This can be done using a `configmap`. Here is a sample configmap that can be used:

```yaml
kind: ConfigMap
apiVersion: v1
metadata:
  name: nginx-config
  namespace: nginx-ingress
data:
  resolver-addresses: <kube-dns-ip>
  resolver-valid: 5s
```

We will need to know our `kube-dns` service IP. This is required so NGINX Ingress controller can resolve Microsoft Azure AD correctly to complete the authentication process. NGINX by default caches DNS queries using the TTL value from the response. `resolver-valid` allows us to override that and define our own setting.

To find your `kube-dns` service IP, you can run the following command:

```shell
╰─➤  kubectl get svc -A -owide
NAMESPACE     NAME             TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE   SELECTOR
default       kubernetes       ClusterIP   10.43.0.1       <none>        443/TCP                  10h   <none>
kube-system   kube-dns         ClusterIP   10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP   10h   k8s-app=kube-dns
kube-system   metrics-server   ClusterIP   10.43.239.241   <none>        443/TCP                  10h   k8s-app=metrics-server
```

From the above, we can identify that our `kube-dns` service IP address is `10.43.0.10`

Next, we need to define our OIDC policy for Azure AD:
Here is our OIDC `policy` for Azure AD:

```yaml
apiVersion: k8s.nginx.org/v1
kind: Policy
metadata:
  name: oidc-policy
spec:
  oidc:
    clientID: <change_to_your_client_id>
    clientSecret: <replace_with_name_of_kubernetes_secret_created>
    authEndpoint: <authEndpoint is collected from endpoints in Azure AD>
    tokenEndpoint: <authEndpoint is collected from endpoints in Azure AD> 
    jwksURI: <authEndpoint is collected from endpoints in Azure AD> 
    scope: openid+profile+email
    accessTokenEnable: true
```

The above values will be replaced with the `endpoint` information we captured above, when we looked at the `well-known/openid-configuration` endpoint information. Replace with your specific values. 

Now we apply the `policy` to our `virtualserver` resource:

```yaml
apiVersion: k8s.nginx.org/v1
kind: VirtualServer
metadata:
  name: cafe
spec:
  host: cafe.example.com
  tls:
    secret: tls-secret
    redirect:
      enable: true
  upstreams:
    - name: coffee
      service: coffee-svc
      port: 80
    - name: tea
      service: tea-svc
      port: 80
  routes:
    - path: /tea
      policies:
      - name: oidc-policy
      action:
        pass: webapp
    - path: /coffee
      action:
        pass: coffee
```

You can verify the successufly setup of the `virtualserver` and `policy` by running the following commands:  

Retrieving status of `virtualserver`:
```bash
~$ kubectl get virtualserver
NAME     STATE   HOST                 IP           PORTS      AGE
cafe   Valid   cafe.example.com   172.18.0.2   [80,443]   10m
```
To retrieve the status of the `policy`:

```shell
~$ kubectl get policy
NAME          STATE   AGE
oidc-policy   Valid   14m
```

With the status of `virtualserver` and `policy` showing `valid` we conclude we have successuflly configured NGINX Ingress controller.

You can now test your Azure AD setup with NGINX Ingress controller.   
Open up your browser and head to `https://cafe.example.com`. 
If everything has been configured correctly, you should see the browser address bar redirect to Azure AD for authentication logon prompt. Once you successfully provide your Microsoft Azure AD credentials, NGINX Ingress controller will validate the succesfull login and then allow your reques to the backend resource.

**This completes the Lab.** 
<br/>

## References: 

- [NGINX Ingress controller OIDC](https://docs.nginx.com/nginx-ingress-controller/configuration/policy-resource/#oidc)
<br/>

### Authors
- Chris Akker - Solutions Architect - Community and Alliances @ F5, Inc.
- Shouvik Dutta - Solutions Architect - Community and Alliances @ F5, Inc.
- Jason Williams - Principle Technical Product Management Engineer @ F5, Inc.

-------------

Navigate to ([Lab4](../lab4/readme.md) | [Main Menu](../LabGuide.md#lab-outline))
