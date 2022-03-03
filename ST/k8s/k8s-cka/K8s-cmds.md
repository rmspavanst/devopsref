#Generate a plain-text list of all namespaces
kubectl get namespaces 

#Generate a plain-text list ofall pods
kubectl get pods

#Generate a detailed plain-text list of all pods
kubectl get pods -o wide

#Generate a list of all pods running on a particular node server
kubectl get pods --field-selector=spec. nodeName=[server-name]

#List a specific replication controller in plain text
kubectl get replicationcontroller [replication-controllername]

#Generate a plain-text list of all replication controllers and services
kubectl get replicationcontroller, services

#Generate a plain-text list of all daemon sets
kubectl get deamonset

#to create a new namespace, type:
kubectl create namespace [namespace-name]

#Create a resource from a JSON or YAML file
kubectl create –f [filename]

#Create a new service with the definition contained in a [service-name].yaml file:
kubectl apply -f [service-name].yaml

#Create a new replication controller with the definition contained in a [controller-name].yaml file:
kubectl apply -f [controller-name].yaml

#Create the objects defined in any .yaml, .yml, or .json file in a directory:
kubectl apply -f [directory-name]

#to edit a service, type:
kubectl edit svc/[service-name]

#Edit a service in a non-default editor:
KUBE_EDITOR=”[editor-name]” kubectl edit svc/[service-name]

#View details about a particular node:
kubectl describe nodes [node-name]

#View details about a particular pod:
kubectl describe pods [pod-name]

#Display details about a pod whose name and type are listed in pod.json:
kubectl describe -f pod.json

#See details about all pods managed by a specific replication controller:
kubectl describe pods [replication-controller-name]

#Show details about all pods:
kubectl describe pods

#Remove a pod using the name and type listed in pod.yaml:
kubectl delete -f pod.yaml

#Remove all pods and services with a specific label:
kubectl delete pods,services -l [label-key]=[label-value]

#Remove all pods (including uninitialized pods):
kubectl delete pods --all

#Receive output from a command run on the first container in a pod:
kubectl exec [pod-name] -- [command]

#Get output from a command run on a specific container in a pod:
kubectl exec [pod-name] -c [container-name] -- [command]

#Run /bin/bash from a specific pod. The received output comes from the first container:
kubectl exec -ti [pod-name] -- /bin/bash

#Display the current context:
kubectl config current-context

#Set a cluster entry in kubeconfig:
kubectl config set-cluster [cluster-name] --server=[server-name]

#Unset an entry in kubeconfig:
kubectl config unset [property-name]

#Print logs:
kubectl logs [pod-name]

#To stream logs from a pod, use:
kubectl logs -f [pod-name]


Short Name	Long Name
csr	    certificatesigningrequests
cs	    componentstatuses
cm	    configmaps
ds	    daemonsets
deploy	deployments
ep	    endpoints
ev	    events
hpa	    horizontalpodautoscalers
ing	    ingresses
limits	limitranges
ns	    namespaces
no	    nodes
pvc	    persistentvolumeclaims
pv	    persistentvolumes
po	    pods
pdb	    poddisruptionbudgets
psp	    podsecuritypolicies
rs	    replicasets
rc	    replicationcontrollers
quota 	resourcequotas
sa	    serviceaccounts
svc	    services