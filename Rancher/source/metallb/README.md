# Install Metal LB



```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/namespace.yaml
```
```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/metallb.yaml
```

```
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```
Check to see that Metal LB deployed properly

```
kubectl get all -n metallb-system
```

In this manifest please add a bank of ip addresses that is appropriate for you network.

<br>

Apply the config file
```
kubectl apply -f config.yaml
```