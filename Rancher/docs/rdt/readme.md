![Nginx Ingress Workshop](/media/nginx-ingress-workshop-banner.png)

# Starter K8s Dev Environment
The purpose of this exercise is to offer a simple and easily accessible way to set up basic dev tools and a local Kubernetes cluster to allow a beginner
a low risk way to work with and learn Kubernetes concepts using the open source Ingress Controller from NGINX Inc. All from the comfort of your own laptop.

This setup will act as a foundation for future explorations into NGINX solutions, GitOps, and the Kubernetes ecosystem.

## Setting up Basic Tools

Mac Edition

Windows Edition (Coming Soon...)

## Mac Edition

### [Setting up tools](https://github.com/nginxinc/nginx-ingress-workshops/blob/main/Rancher/docs/rdt/readme.md#setting-up-tools-1)
- [ ] Install Homebrew
	- [ ] Install Xcode
	- [ ] Install Homebrew
- [ ] Install Git
- [ ] Install VSCode
	- [ ] Get Dracula or Dracula Refined (Optional Quality of life)
	- [ ] Material Icon Theme (Optional Quality of life)
- [ ] Install OhMyZSH! (Optional Quality of life)
	- [ ] Enable agnoster or amuse theme
- [ ] Install Powerline fonts from Nerd Fonts (Optional Quality of life)
- [ ] Install Fig (Optional Quality of life)
	- [ ] Install Fig VSCode extension
	- [ ] Set theme to dracula

### [Pull the NGINX Ingress workshop repo from GitHub](https://github.com/nginxinc/nginx-ingress-workshops/blob/main/Rancher/docs/rdt/readme.md#pull-the-nginx-ingress-workshop-repo-from-github-1)

[//]: # (Is this referencing pulling through GUI? as later in the guide, we use the CLI command `git clone` to pull it down)
This can be done several ways however for this exercise we will be using VSCode.

- [ ] Setup VSCode to work with GitHub
- [ ] Establish a local location for code from GitHub to live
- [ ] Clone the GitHub repo for this exercise
- [ ] Brief repo overview
	- [ ] Navigate to the location in the repo used in this exercise

[//]: # (Do we expect participants to understand what k3s is? If not, maybe short synposis of what the k3s distribution is could be useful)
### [Local K3s Devopment Environment](https://github.com/nginxinc/nginx-ingress-workshops/blob/main/Rancher/docs/rdt/readme.md#local-k3s-devopment-environment-1)

**Tip:** to show hidden files on MacOS hit shift+command+period. This will be helpful later when we copy the `overide.yaml` file to the appropriate location.

- [ ] Install Rancher Desktop (RDT)
	- [ ] Deploy the "override.yaml" to disable Klipper in RDT
- [ ] Install K8s extensions in VSCode
	- [ ] Kubernetes (MS)
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

#### Install VSCode or VSCodium
[Website](https://vscodium.com/#intro) or [Website](https://code.visualstudio.com)

VSCode can be installed via the disk image installer found on their [website](https://code.visualstudio.com/)
or through Homebrew (recommended)

**VSCode**
```
brew install --cask visual-studio-code
```
**VSCodium**
```
brew install --cask vscodium
```

**Optional (quality of life)**

In the extensions area of VSCode add the following extensions if you want to add some flavor to your code editor.

- Dracula or Dracula Refined
- Material Icon Theme

#### Install OhMyZsh
[Website](https://ohmyz.sh)

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Set the theme to agnoster or amuse**

Open the ZSH configuration file (`~/.zshrc`) using an editor 
of your choice. In the following example we are using the program `vi`,
but feel free to use `nano` if that is more comfortable.
```
vi ~/.zshrc
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
- Open the command pallet View > Command Pallet
- Type "settings" and select the Preferences: Open Settings (UI) option.
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
Once installed `fig` should work out of the box after a couple minor changes.

- You will need to login to use it, I just use SSO via my GitHub account, you may opt for an alternative method.
- Fig requires permission to be enabled in Systems Settings > Privacy & Security > Accessability, tick the option next to fig.
- You will need to restart VSCode as well for it to work with the terminal window

**note:** if you continue to run into issues you may need to run the following commands, and follow any instructions that it recommends.

```
fig doctor
```

<br>

[Top](https://github.com/nginxinc/nginx-ingress-workshops/blob/main/Rancher/docs/rdt/readme.md#pull-the-nginx-ingress-workshop-repo-from-github)

<br>

## Pull the NGINX Ingress workshop repo from GitHub

**Via Command Line**

1. Open a new terminal via the Terminal > New Terminal menu located at the top of the VSCode window.
2. Find or create a directory to store the cloned repository necessary for this workshop.
   3. You can use `mkdir ~/Documents/nginx-workshop/` to create a folder in `~/Documents` to use for purposes of this workshop.
3. Navigate to the chosen location in your terminal using the `cd` command. 
   4. If you used the `mkdir` example command in the previous step, navigate to it using `cd ~/Documents/nginx-workshops/`
4. Clone the workshop materials GitHub repository by using the following:
```sh
git clone https://github.com/nginxinc/nginx-ingress-workshops.git
```

**Note:** If you would like to specify the folder name use the command below and substitute your own name

```sh
git clone https://github.com/nginxinc/nginx-ingress-workshops.git [your folder name here]
```

Now that we have the working repo cloned, we can begin building out our local Kubernetes dev environment. 

Navigate into the cloned repository using the command below. If you specified a custom folder name (as
the second argument to `git clone`), replace `nginx-ingress-workshops` with the specified custom folder.

```sh
cd nginx-ingress-workshops
```

For this exercise we will only be using the content found within the `./Rancher` folder of the cloned repository. Navigate
to the `Rancher` folder using the following:

```sh
cd ./Rancher
```

<br>

[Top](https://github.com/nginxinc/nginx-ingress-workshops/blob/main/Rancher/docs/rdt/readme.md#local-k3s-devopment-environment)

<br>

## Local K3s Devopment Environment
#### Install Rancher Desktop
[Website](https://rancherdesktop.io)

**Steps**
- Download the binary for your Mac type and run the `.dmg` installer
- Drag Rancher Desktop (RDT) into the `Applications` folder.
- Run Rancher Desktop from the Mac Launcher.
- Once it launches a popup window will appear that allows you make settings to the local K3s cluster.
- Deselect the option to deploy K3s for now.

**Deploy the override.yaml**

This is required to turn off the internal load balancer, `Klipper`, in RDT, which we will not need
for the purposes of this workshop.

- Locate the `overide.yaml` file in our the git repo location below.
```
cd Rancher/source/rdt/
```
- Copy `override.yaml` to the following directory using the command below.
```
cp override.yaml $HOME/Library/Application Support/rancher-desktop/lima/_config
```

**Final settings and launch for Kubernetes on RDT**

- From within RDT, click the "Cog" icon on the top-right of the window, opening RDT's preferences.
- Locate and switch to the "Virtual Machine" tab.
	- Set memory to 8 gb if possible
	- Set CPUs to 4 if possible
- Locate and switch to the Kubernetes tab
	- Check the box next to enable Kubernetes
	- Uncheck the box next to Traefik
	- Click apply and allow RDT to finish loading

Once this process completes you will have locally created a clean Kubernetes cluster, with no ingress controller or load balancer defined. 

#### Add two K8s focused extensions to VSCode

**Steps**
- Navigate to the extesions UI in VSCode
- search for Kubernetes
- Install the Kubernetes extesion from MS
- The YAML one from Red Hat should automaticall install with the MS one.
- Navigate to the K8s UI by clicking on the kubernetes logo in the left navigation bar.
- Validate the Rancher cluster showes up in the first panel

#### Install k9s
[Website](https://k9scli.io)

**Via Homebrew**
```
brew install derailed/k9s/k9s
```

To start k9s just open a terminal session in VSCode, I like to put mine in the top window in VSCode, and type.

```
k9s
```

**Note:** VSCode may require a restart after this if k9s is not showing the K8s cluster properly. Also, nothing will show up until the local single node cluster for Rancher Desktop is active.

#### Install Metal LB
[Website](https://metallb.universe.tf)

Deploy MetalLB
```sh
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.9/config/manifests/metallb-native.yaml
```

We will now configure Metal LB as our load balancer. For the purposes of this workshop, we have included default manifest files 
that specify an IP range (`/Rancher/source/metallb`) for MetalLB to utilize. 

**Note:** If this default IP range is occupied on your local network, adjust the configuration files to specify
an unoccupied IP range.

The default content of both files is included below:

**IPAddressPool.yaml**
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

**L2Advertisement.yaml**
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

Run the following commands to apply our manifests to the cluster.
```
kubectl apply -f IPAddressPool.yaml
kubectl apply -f L2Advertisement.yaml
```

#### Install NGINX OSS Ingress via Helm
[Website](https://docs.nginx.com/nginx-ingress-controller/installation/)

Install using helm (preferred)
or
Install using manifests

**Add the NGINX repo**
```
helm repo add nginx-stable https://helm.nginx.com/stable
```

**Update via Helm**
```
helm repo update
```

**Create NGINX namespace**
```
kubectl create namespace nginx-ingress
```

**Install NGINX Ingress controller**
```
kubectl config set-context --current --namespace=nginx-ingress
```

[//]: # (Possible point of confusion, if we aren't using "my-relase" anywhere in the workshop and just want to demonstrate
command syntax, maybe opt to use `helm install <release-name> <repository-name>` instead?)
**Base Helm command**
```
helm install my-release nginx-stable/nginx-ingress
```

**Helm command to support this workshop**
```sh
helm install nic nginx-stable/nginx-ingress \
	--namespace nginx-ingress \
	--set controller.nginxStatus.enable=true \
	--set controller.customPorts\[0\].containerPort=9000 \
	--set controller.nginxStatus.port=9000 \
	--set controller.nginxStatus.allowCidrs=0.0.0.0/0 \
	--set prometheus.create=true
```

**Helm with custom port and ConfigMap:**

```sh
helm install nic nginx-stable/nginx-ingress \
	--namespace nginx-ingress \
	--set controller.nginxStatus.enable=true \
	--set controller.customPorts\[0\].containerPort=9000 \
 	--set controller.nginxStatus.port=9000 \
 	--set controller.nginxStatus.allowCidrs=0.0.0.0/0 \
 	--set prometheus.create=true \
 	--set controller.customConfigMap=nic-nginx-config \
 	--set controller.enableSnippets=true
```

Note: "my-release" can be changed to any name.  It is important to use the name "nic" for this workshop.

**Uninstall NGINX Ingress Controller**

```sh
helm uninstall ny-release
# or
helm uninstall nic
```

Validate that the nginx service was properly assigned an External-IP, while in the "nic" namespace, by running the following
```sh
kubectl get all -n nginx-ingress
```

Your terminal output should somewhat resemble the following:
```
NAME                                     READY   STATUS    RESTARTS   AGE
pod/nic-nginx-ingress-55dd46fcf9-smvng   1/1     Running   0          62s

NAME                        TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)                      AGE
service/nic-nginx-ingress   LoadBalancer   10.43.171.131   10.1.1.100   80:30888/TCP,443:31517/TCP   62s

NAME                                READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/nic-nginx-ingress   1/1     1            1           62s

NAME                                           DESIRED   CURRENT   READY   AGE
replicaset.apps/nic-nginx-ingress-55dd46fcf9   1         1         1       62s

```
<br>

[Top](https://github.com/nginxinc/nginx-ingress-workshops/blob/main/Rancher/docs/rdt/readme.md#starter-k8s-dev-environment)

<br>
Fin...

### Authors
- Dylen Turnbull - Developer Relations @ NGINX Inc.
- Chris Akker - Technical Solutions Architect @ F5, Inc.

