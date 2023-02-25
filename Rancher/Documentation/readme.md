![Nginx Ingress Workshop](/media/nicworkshop-banner.png)

# Rancher Nginx Ingress Controller Workshop

# **Under Contruction - this is a Preview of the Workshop**

<br/>

# Starter K8s Dev Environment
The purpose of this exercise is to offer a simple and easily accessable way to set up basic dev tools and a local Kubernetes cluster to allow a beginner a low risk way to work with and learn kubernetes concepts using the NGINX Inc. Ingress controller.

This will act as a foundation for future explorations into the Kubernetes eccocsystem.

## Setting up Basic Tools

### Setting up CLI tools the way I like them
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#installng-homebrew) Homebrew
	- [ ] Install Xcode
	- [ ] Intall Homebrew
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#intalling-git) Git
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#install-vscodium-or-vscode) VSCode
	- [ ] Get Dracula Refined (Optional)
	- [ ] Material Icon Theme (Optional)
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#install-oh-my-zsh) OhMyZSH! (Optional)
	- [ ] Enable agnoster or amuse theme
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#install-powerline-fonts) Powerline fonts (Optional)
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#install-fig) Fig (Optional)
	- [ ] Install Fig VSCode extension
	- [ ] Set theme to dracula

### K8s Local development environment the way I like it
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#local-k3s-devopment-environment) Rancher Desktop
	- [ ] Deploy the "override.yaml" found in the "rancherdt"
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#add-two-k8s-focused-extensions-to-vscode) K8s extensions in VSCode
	- [ ] Kubernets (MS)
	- [ ] YAML (RedHat)
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#install-k9s) K9s (Optional)
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#install-metal-lb) Metal LB
- [ ] [Install](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#install-nginx-oss-ingress-via-cli) NGINX OSS Ingress

#### Installng Homebrew
[Website](https://brew.sh)
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#setting-up-cli-tools-the-way-i-like-them)

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
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#setting-up-cli-tools-the-way-i-like-them)

Via Homebrew
```
brew install git
```

#### Install VSCodium or VSCode
[Website](https://vscodium.com/#intro) or [Website](https://code.visualstudio.com)
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#setting-up-cli-tools-the-way-i-like-them)

Via dmg download or Homebrew
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
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#setting-up-cli-tools-the-way-i-like-them)

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

#### Install Powerline fonts
[Website](https://github.com/powerline/fonts)
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#setting-up-cli-tools-the-way-i-like-them)

Clone the powerline font repo
```
git clone https://github.com/powerline/fonts.git --depth=1
```

Run the insall script
```
cd fonts
./install.sh
```

#### Set powerline font in VScode/VSCodium 
[Website](https://www.nerdfonts.com/font-downloads)
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#setting-up-cli-tools-the-way-i-like-them)

Install a powerline enabled font, I use mononoki
```
brew tap homebrew/cask-fonts &&
brew install --cask font-mononoki-nerd-font
```

**Alternative install method**
- Download and install the font of your choice I picked "Mononoki Nerd Font"
- Install using the Mac Font Book and install all the fonts for Mac
- Open the command pallett View > Command Pallett
- Type "settings" and select the Prefrences: Open Settings (UI) option.
- In the search field type "terminal font"
- Under Terminal > Integrated: Font Family paste the following in the empty text field
- "Mononoki Nerd Font Mono"
- Set the font size from 12 to 16 (optional)
- 
<br>

#### Install FIG
[Website](https://fig.io/download)
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#setting-up-cli-tools-the-way-i-like-them)

Install FIG using Homebrew
```
brew install --cask fig
```


### Local K3s Devopment Environment


#### Install Rancher Desktop
[Website](https://rancherdesktop.io)
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#k8s-local-development-environment-the-way-i-like-it)
<br>
**Steps**
- Download the binary for your Mac type and Run the .dmg
- Drack Rancher desktop into the applications folder.
- Once it completes a popup window will appear that allows you make seettings to the local K3s cluster.
- Deselect the option to deploy K3s for now.
- From the rancher menu select prefrences and navigate to the Kubernetes tab.
- Locate and switch to the "Virtual Machine" tab.
	- Set memory to 8 gb if possible
	- Set CPUs to 4 if possible
- Click on the Kubernetes tab and deselect the Traefik check box.
- Click apply and exit out of prefrences.
- Next navigate to troubleshooting in the main RDT window
- Locate and click on the Rest Kubernetes button to reset the cluster
- In the following pop up window select the option to delete container images and click reset.
- Once this process finishes you will have a base cluster  with no ingress or Loadbalancer defined to work with.

<br>

#### Add two K8s focused extensions to VSCode
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#k8s-local-development-environment-the-way-i-like-it)
<br>
**Steps**
- Navigate to the extesions UI in VSCode
- search for Kubernetes
- Install the Kubernetes extesion from MS
- The YAML one from Red Hat should automaticall install with the MS one.
- Navigate to the K8s UI by clicking on the kubernetes logo in the left navigation bar.
- Validate the the Rancher cluster showes up in the first panel

<br>

#### Install k9s
[Website](https://k9scli.io)
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#k8s-local-development-environment-the-way-i-like-it)

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
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#k8s-local-development-environment-the-way-i-like-it)

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
<br>
[Top](https://gist.github.com/DylenTurnbull/0bfb7d519c0174e3b968a52cdadc5546#k8s-local-development-environment-the-way-i-like-it)

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

Install NGINX Ingress controller
```
helm install my-release nginx-stable/nginx-ingress
```
Note: "my-release" can be changed to any name I like to use "nic"

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

### Authors
- Dylen Turnbull - Developer Relations @ NGINX Inc.
- Chris Akker - Technical Solutions Architect @ F5, Inc.

