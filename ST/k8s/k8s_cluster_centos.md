
Master and worker node:
------------------------

hostnamectl set-hostname worker-node-1
vi /etc/hosts
ping master-node
sudo yum install -y yum-utils
ip addr
reboot
yum install lsof git curl wget net-tools -y
hostnamectl set-hostname kube-master

vi /etc/fstab (commentout the swap)
swapoff -a

firewall-cmd --permanent --add-port=6443/tcp
firewall-cmd --permanent --add-port=10250/tcp
systemctl status firewalld
sudo firewall-cmd --reload


cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf 
net.bridge.bridge-nf-call-ip6tables = 1 
net.bridge.bridge-nf-call-iptables = 1 
EOF
sysctl --system


cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo 
[kubernetes] 
name=Kubernetes 
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch 
enabled=1 
gpgcheck=1 
repo_gpgcheck=1 
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg 
exclude=kubelet kubeadm kubectl 
EOF


setenforce 0 

sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

sestatus

yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
yum update -y && yum install containerd.io docker-ce docker-ce-cli


mkdir /etc/docker 
cat > /etc/docker/daemon.json <<EOF 
{ 
  "exec-opts": ["native.cgroupdriver=systemd"], 
  "log-driver": "json-file", 
  "log-opts": { 
    "max-size": "100m" 
  }, 
  "storage-driver": "overlay2", 
  "storage-opts": [ 
    "overlay2.override_kernel_check=true" 
  ] 
} 
EOF


#mkdir -p /etc/systemd/system/docker.service.d 
systemctl daemon-reload
systemctl restart docker
systemctl enable docker


yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes 

echo 'KUBELET_EXTRA_ARGS="--fail-swap-on=false"' > /etc/sysconfig/kubelet
systemctl enable --now kubelet

cat /etc/sysconfig/network-scripts/ifcfg-enp0s3


In Master node:
----------------

kubeadm init --pod-network-cidr 10.244.0.0/16 --apiserver-advertise-address=192.168.0.157 (change to master ip)

watch docker images


mkdir -p $HOME/ .kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

## to create network
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# curl https://docs.projectcalico.org/manifests/calico.yaml -O
# kubectl apply -f calico.yaml


kubeadm join 192.168.0.120:6443 --token 77h1ak.dkb8iu8lvwb3btrg --discovery-token-ca-cert-hash sha256:fe300860ee55a41082aa068d874d876dcb3e596318d604baf898b16ce9ef7c92


In Worker Node:
-----------------



kubeadm join 192.168.0.157:6443 --token ycu5yd.att8mgqyf8qg9w44 --discovery-token-ca-cert-hash sha256:b2e9753ab8b2672cc8bfd75437f024b1289c4bcee28c001f780fae4a30812fdb


[ERROR CRI]: container runtime is not running

rm -rf /etc/containerd/config.toml
systemctl restart containerd

systemctl status containerd


kubectl label node <node name> node-role.kubernetes.io/<role name>=<key - (any name)>


crictl images
crictl ps -a

crictl config runtime-endpoint unix:///run/containerd/containerd.sock
crictl config image-endpoint unix:///run/containerd/containerd.sock



https://adamtheautomator.com/kubernetes-ingress/

https://stackoverflow.com/questions/70495784/issue-while-creating-ingress
or 
https://agones.dev/site/docs/installation/install-agones/yaml/#installing-agones



https://matthewpalmer.net/kubernetes-app-developer/articles/kubernetes-ingress-guide-nginx-example.html


https://adamtheautomator.com/install-kubernetes-ubuntu/


Helm:
======

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


Nginx_ingress_controller:
=========================

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm repo update 

helm install nginx-ingress ingress-nginx/ingress-nginx --set controller.publishService.enabled=true

kubectl get all -A

ex:
===

An example Ingress that makes use of the controller:
  apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    name: example
    namespace: foo
  spec:
    ingressClassName: nginx
    rules:
      - host: www.example.com
        http:
          paths:
            - pathType: Prefix
              backend:
                service:
                  name: exampleService
                  port:
                    number: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
      - hosts:
        - www.example.com
        secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls



kubectl --namespace default get services -o wide -w nginx-ingress-ingress-nginx-controller (to get external IP)


Deploying an NGINX Application and Service:
===========================================

1. Create a file named NGINX.yaml configuration file in the ~/nginx-ingress-controller directory

Note: The below nginx.yaml file will create the deployment nginx-deployment and Kubernetes service named nginx-service. This configuration will create a Kubernetes service which will be accessed externally via external ingress load-balanced service.

vi nginx.yml

---
# Defining the Kubernetes API version
apiVersion: apps/v1
kind: Deployment
# Defining the type of the object to create kind: Deployment
# Metadata helps uniquely identify the object, including a name string, UID, and optional namespace.
metadata:
# nginx-deployment as the name of the deployment.
  name: nginx-deployment
# Labels are key/value pairs attached to objects, such as pods. 
# Labels are used to specify identifying attributes of objects that are relevant to users.
  labels:
    app: nginx-first-app
spec:
# replicas: 2 replicas allow you to define the number of pods you need for deployment
  replicas: 2
  selectors:
    matchLabels:
      app: nginx-first-app
  template:
    metadata:
      labels:
        app: nginx-first-app
# spec: Allows you to specify the container details such as the image (nginx) container's name (nginx-pod)
    spec:
      containers:
      - name: nginx-pod
        image: nginx
---
apiVersion: v1
kind: Service
metadata:
# nginx-service as the name of the service.  name: nginx-service
spec:
  type: ClusterIP
  ports:
  - port: 80
    targetPort: 8080
  selector:
    app: nginx-first-app


kubectl apply -f nginx.yaml

kubectl get service nginx-service 



Creating the Ingress resource to expose the NGINX service:
==========================================================

1. Create a file named kubernetes-ingress.yaml


# Defining the Kubernetes API version
apiVersion:: thetworking.k8s.io/v1
kind: Ingress
metadata:
  name: kubernetes-ingress
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  rules:
# External name of the ingress service with an type load balancer
  - host: "k8s-01"
    http:
# Rules 
      paths:
      - pathType: Prefix
        path: "/"
        backend:
# Kubernetes Service that will be redirected from the kubernetes 
          service:
            name: nginx-service
            port:
              number: 80

kubectl apply -f Kubernetes-ingress.yaml




