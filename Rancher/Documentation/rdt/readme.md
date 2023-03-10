![Nginx Ingress Workshop](/media/nicworkshop-banner.png)

# Starter K8s Dev Environment
The purpose of this exercise is to offer a simple and easily accessible way to set up basic dev tools and a local Kubernetes cluster to allow a beginner a low risk way to work with and learn Kubernetes concepts using the open source Ingress controller from NGINX Inc. All from the comfort of your own laptop.

This setup will act as a foundation for future explorations into NGINX solutions, GitOps, and the Kubernetes ecosystem.

## Setting up Basic Tools

Mac Edition
Windows Edition (Comming Soon...)

## Mac Edition
### [Setting up tools](https://github.com/nginxinc/nginx-ingress-workshops/blob/RancherDTContentAdd/Rancher/Documentation/rdt/readme.md#setting-up-tools-1)
- [ ] Install Homebrew
	- [ ] Install Xcode
	- [ ] Intall Homebrew
- [ ] InstallGit
- [ ] Install VSCode
	- [ ] Get Dracula Refined (Optional Quality of life)
	- [ ] Material Icon Theme (Optional Quality of life)
- [ ] Install OhMyZSH! (Optional Quality of life)
	- [ ] Enable agnoster or amuse theme
- [ ] Install Powerline fonts from Nerd Fonts (Optional Quality of life)
- [ ] Install Fig (Optional Quality of life)
	- [ ] Install Fig VSCode extension
	- [ ] Set theme to dracula
### [Pull the NGINX Ingress workshop repo from GitHub](https://github.com/nginxinc/nginx-ingress-workshops/blob/RancherDTContentAdd/Rancher/Documentation/rdt/readme.md#pull-the-nginx-ingress-workshop-repo-from-github-1)
This can be done several ways however for this exercise we will be using VSCode.

- [ ] Setup VSCode to work with GitHub
- [ ] Establish a local location for code from GitHub to live
- [ ] Clone the GitHub repo for this exercise
- [ ] Brief repo overview
	- [ ] Navigate to the location in the repo used in this exercise

### [Local K3s Devopment Environment](https://github.com/nginxinc/nginx-ingress-workshops/blob/RancherDTContentAdd/Rancher/Documentation/rdt/readme.md#local-k3s-devopment-environment-1)
**note:** to show hidden files on Mac OS hit shift+command+period. This will be helpful when we copy the overide.yaml file to the appropriate location.

- [ ] Install Rancher Desktop (RDT)
	- [ ] Deploy the "override.yaml" to disable Klipper in RDT
- [ ] Install K8s extensions in VSCode
	- [ ] Kubernets (MS)
	- [ ] YAML (RedHat)
- [ ] Install K9s (Optional Quality of life)
- [ ] Install Metal LB
- [ ] Install NGINX OSS Ingress

<br>

## Setting up tools

#### Install Homebrew
[Website](https://brew.sh)

Install Xcode
```
xcode-select --install
```

Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Intalling Git
[Website](https://git-scm.com/download/mac)

Via Homebrew
```
brew install git
```

#### Install VSCodium or VSCode
[Website](https://vscodium.com/#intro) or [Website](https://code.visualstudio.com)

VSCode can be installed via dmg download or Homebrew (recommended)

VSCode
```
brew install --cask visual-studio-code
```
VSCodium
```
brew install --cask vscodium
```

#### Install Oh My Zsh
[Website](https://ohmyz.sh)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Set the theme to agnoster or amuse**
Open the zshrc with VI
```
vi .zshrc
```
```
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"<---ChangeThis
```

#### Install Powerline fonts from Nerd Fonts  
[Website](https://www.nerdfonts.com/font-downloads)

Install a powerline enabled font, I use mononoki
```
brew tap homebrew/cask-fonts &&
brew install --cask font-mononoki-nerd-font
```

**Set font type in VScode/VSCodium**
- Open the command pallett View > Command Pallett
- Type "settings" and select the Prefrences: Open Settings (UI) option.
- In the search field type "terminal font"
- Under Terminal > Integrated: Font Family paste the following in the empty text field
- "Mononoki Nerd Font Mono"
- Set the font size from 12 to 16 (optional)

#### Install FIG
[Website](https://fig.io/download)

Install FIG using Homebrew
```
brew install --cask fig
```

**Check for the FIG extension in VSCode**
Once installed fig should add its extention to VSCode
To validate in VSCode;
- List itemGo to "Extensions" menue in the left side bar and validate fig is present.

**Set the AutoComplete theme**
You can also set FIG to a specific theme I use "Dracula" to match my VSCode theme. This can be done by;
- Opening the fig "settings" UI and selecting Personal > Auto Complete > Popular in the left nav bar area of the main fig UI
- Under "Theme" set the dropdown to "Dracula" 

<br>

[Top](https://github.com/nginxinc/nginx-ingress-workshops/blob/RancherDTContentAdd/Rancher/Documentation/rdt/readme.md#pull-the-nginx-ingress-workshop-repo-from-github)

<br>

## Pull the NGINX Ingress workshop repo from GitHub

**Via command line**

- Open an new VSCode window
- Open a new terminal via the Terminal > New Terminal menu at the top fo the VSCode window.
- Change directories to the root location you would like to store your GitHub source
note: This will be diffrent for each user you will need to extablish this location I use the location below.
```
cd Documents/source/github/
```

- List itemClone the github repo below
```
git clone https://github.com/nginxinc/nginx-ingress-workshops.git
```

**Note:** If you would like to specify the folder name use the command below and substitute your own name

```
git clone https://github.com/nginxinc/nginx-ingress-workshops.git [your folder name here]
```

- List itemSkip to the bottom of this section to continue...

**Via the VSCode UI**
- Open a new VSCode window
- Authenticate VSCode with GitHub
```
Get exact command line for this
```
- Select the "Source Control" option in the upper left corner of the VSCode window
- Select "Clone Repository"
- Select "Clone from GitHub" in the "command pallett" field
- Locate and copy the git link from GitHub via a browser.
```
https://github.com/nginxinc/nginx-ingress-workshops.git
```

- Paste this in to the "Command Pallett" field and hit enter
- Specify a location for this repo to be stored locally I use the path below. You will need to choose where you would like to store repos from GitHub.
```
/Users/D.Turnbull/Documents/source/github/
```
- Select "Select as Repository Destination" and follow the prompts. It is recommended to open a new window if your are not already in one.

Now we have the working repo cloned so we can begin working on building out our Kubernetes dev envrironment. For this exercise we will only be using the content found in the repo location below.

```
cd Rancher/
```

<br>

[Top](https://github.com/nginxinc/nginx-ingress-workshops/blob/RancherDTContentAdd/Rancher/Documentation/rdt/readme.md#local-k3s-devopment-environment)

<br>

## Local K3s Devopment Environment
#### Install Rancher Desktop
[Website](https://rancherdesktop.io)

**Steps**

- Download the binary for your Mac type and run the .dmg
- Drag Rancher Desktop (RDT) into the applications folder.
- Run Rancher Desktop from the Mac Launcher.
- Once it launches a popup window will appear that allows you make seettings to the local K3s cluster.
- Deselect the option to deploy K3s for now.
- From the rancher menu select prefrences and navigate to the Kubernetes tab.
- Locate and switch to the "Virtual Machine" tab.
	- Set memory to 8 gb if possible
	- Set CPUs to 4 if possible

**Deploy the override.yaml**
This is required to turn off the internal loadbalnacer Klipper in RDT.

- Locate the overide.yaml file in our the git repo location below.
```
cd Rancher/source/rancherdt/
```

- Copy it to the directory below

```
cp overide.yaml /Users/[Your User Name Here]/Library/Application Support/rancher-desktop/lima/_config
```

**Final setup and launch for Kubernetes on RDT**
- Click on the Kubernetes tab and deselect the Traefik check box.
- Click apply and exit out of prefrences.
- Next navigate to troubleshooting in the main RDT window
- Locate and click on the Rest Kubernetes button to reset the cluster
- In the following pop up window select the option to delete container images and click reset.
- Once this process finishes you will have a base cluster  with no ingress or Loadbalancer defined to work with.

#### Add two K8s focused extensions to VSCode

**Steps**
- Navigate to the extesions UI in VSCode
- search for Kubernetes
- Install the Kubernetes extesion from MS
- The YAML one from Red Hat should automaticall install with the MS one.
- Navigate to the K8s UI by clicking on the kubernetes logo in the left navigation bar.
- Validate the the Rancher cluster showes up in the first panel

#### Install k9s
[Website](https://k9scli.io)

Via Homebrew
```
 brew install derailed/k9s/k9s
```

To start k9s just open a terminal session in VSCode, I like to put mine in the top window in vscode, and type.

```
k9s
```

Note: nothing will show up untill the local single node cluster for Rancher Desktop is active.

#### Install Metal LB
[Website](https://metallb.universe.tf)

Deploy MetalLB
```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.9/config/manifests/metallb-native.yaml
```

Create and Apply the following manifests to add your IP range
Note: you will need to set aside a bank on your local network.
note: these are already created in the repo just update the addresses to suite your environment apply the manifests

IPAddressPool.yaml
```
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: first-pool
  namespace: metallb-system
spec:
  addresses:
  - 192.168.1.95-192.168.1.99
```

L2Advertisement.yaml
```
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: example
  namespace: metallb-system
spec:
  ipAddressPools:
  - first-pool
```

Run the following commands
```
kubectl apply -f IPAddressPool.yaml
kubectl apply -f L2Advertisement.yaml
```

#### Install NGINX OSS Ingress via CLI
[Website](https://docs.nginx.com/nginx-ingress-controller/installation/)

Install using helm (preferred)
or
Install using manifests

Add the NGINX repo
```
helm repo add nginx-stable https://helm.nginx.com/stable
```

Update via Helm
```
helm repo update
```

Create NGINX namespace
```
kubectl create namespace nginx-ingress
```

Install NGINX Ingress controller
```
helm install my-release nginx-stable/nginx-ingress
```
Note: "my-release" can be changed to any name I like to use "nic"

```bash
helm install nic nginx-stable/nginx-ingress --namespace nginx-ingress --set controller.nginxStatus.enable=true --set controller.nginxStatus.port=9000 --set controller.nginxStatus.allowCidrs=0.0.0.0/0 --set prometheus.create=true --set controller.customPorts[0].containerPort=9000
```


Uninstall NGINX Ingress Controller

```
helm uninstall my-release
```

Validate that the nginx service was properly assigned an external IP
while in the "nic" namespace run the following
```
kubectl get all
```

You should see somthing similar to the following
```
NAME                                     READY   STATUS    RESTARTS   AGE
pod/nic-nginx-ingress-55dd46fcf9-smvng   1/1     Running   0          62s

NAME                        TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)                      AGE
service/nic-nginx-ingress   LoadBalancer   10.43.171.131   192.168.1.95   80:30888/TCP,443:31517/TCP   62s

NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nic-nginx-ingress   1/1     1            1           62s

NAME                                           DESIRED   CURRENT   READY   AGE
replicaset.apps/nic-nginx-ingress-55dd46fcf9   1         1         1       62s

```
<br>

[Top](https://github.com/nginxinc/nginx-ingress-workshops/blob/RancherDTContentAdd/Rancher/Documentation/rdt/readme.md#starter-k8s-dev-environment)

<br>
Fin...

### Authors
- Dylen Turnbull - Developer Relations @ NGINX Inc.
- Chris Akker - Technical Solutions Architect @ F5, Inc.

