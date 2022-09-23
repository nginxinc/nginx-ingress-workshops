This is the placeholder file for requirements and instructions needed for the Workshop and Students to run this in AWS.

3-node cluster should already be deployed in AKS
Accounts
Credentials
k8s metrics server and dashboard should already be running.  Docs here:
https://docs.aws.amazon.com/eks/latest/userguide/metrics-server.html

https://docs.aws.amazon.com/eks/latest/userguide/dashboard-tutorial.html

NetTools pod in Registry
"Golden Image" KIC in Registry

Clean-Up after the workshop is finished

Linux Jumpbox installation:

1.  In UDP, deploy new Ubuntu 20 Server, t2.small with 30GB disk
2. apt get update
3. sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
4. Choose gdm3 as the display manager
5. apt install xrdp
6. More to follow....