################ Still in progress, but you can still try #######################
Author: Eknath Reddy

In this workshop, TKG version used is v1.4.1
For detailed of Installation procedure refer to official vmware doc. We have already installed the required CLI tools for this workshop. 

```dashboard:open-url
url: https://docs.vmware.com/en/VMware-Tanzu-Kubernetes-Grid/1.4/vmware-tanzu-kubernetes-grid-14/GUID-index.html
```

#### Click text to Hello world (with target)

```execute-1
echo "Hello, Welcome to Partner workshop session"
```

#### Click here to check Tanzu version

```execute
tanzu version
```

#### Click here to check Kubectl version

```execute
kubectl version
```

#### Click here to check TMC CLI version

```execute
tmc version
```
Below command should be showing the current context pointing to management cluster.

#### Click here to check the current context

```execute
kubectl config get-contexts
```
Since this is demo workshop, we have deployed 1 control plane and 1 worker node, But it is highly recommended to deploy multiple control plane nodes in production environment. 

#### Click text to check the Nodes

```execute
kubectl get nodes
```

#### Click text to check the pods

```execute
kubectl get pods -A
```

#### Click text to copy

```copy
echo "copy text to buffer"
```

#### Click text to check tanzu management cluster

```execute
tanzu mc get
```

#### Read the config file to understand the variables defined for Tanzu Kubernetes cluster which will be deployed shortly

```execute
cat /home/eduk8s/wc-config.yaml
```
Workload cluster is deployed with your session name space, Idel time for creation time is 10 mins. 

#### Click here to deploy workload cluster

```execute
tanzu cluster create {{ session_namespace }} -f /home/eduk8s/wc-config.yaml
```

Meanwhile you can check the cluster creation logs in Terminal 2
#### Click here to check the progress of workload creation from logs
```execute-2
podname=$(kubectl get pods -n capz-system -o=jsonpath={.items[0].metadata.name})
kubectl logs $podname -n capz-system -c manager -f
```

#### Click here to check the deployed workload clusters 
```execute
tanzu cluster list
```
#### Get credentials and export the config file
```execute
tanzu cluster kubeconfig get {{ session_namespace }} --admin --export-file ~/.kube/config-tkg
```
#### Read the kubeconfig file
```execute
cat  ~/.kube/config-tkg
```
#### Click here to change the context from management cluster to workload
```execute
kubectl config use-context {{ session_namespace }}-admin@{{ session_namespace }} --kubeconfig /home/eduk8s/.kube/config-tkg
```
#### Verify the context
```execute
kubectl config get-contexts --kubeconfig /home/eduk8s/.kube/config-tkg
```
#### Check the nodes in workload cluster
```execute
kubectl get nodes -A --kubeconfig /home/eduk8s/.kube/config-tkg
```
#### Check the pods in workload cluster
```execute
kubectl get pods -A --kubeconfig /home/eduk8s/.kube/config-tkg
```

Deploy a test application in workload cluster

#### Create namespace test-application in workload cluster which will be used to deploy an application
```execute
kubectl create ns test-application --kubeconfig /home/eduk8s/.kube/config-tkg
```
#### Check all the namespaces in workload cluster
```execute
kubectl get ns --kubeconfig /home/eduk8s/.kube/config-tkg
```
#### Create a deployment with 2 replicas
```execute
kubectl create deployment spring-deploy --port=8080 --image=eknath009/tbs-spring-image:3 --replicas=2 -n test-application --kubeconfig /home/eduk8s/.kube/config-tkg
```
#### Expose the deployment 
```execute
kubectl expose deployment spring-deploy --port=8080 --type=LoadBalancer -n test-application --kubeconfig /home/eduk8s/.kube/config-tkg
```
#### Collect the External IP and access the same in browser
```execute
kubectl get svc -n test-application --kubeconfig /home/eduk8s/.kube/config-tkg
```

![Cody Languages](images/test-application.png)

#### Variable interpolation

workshop_name: {{ workshop_name }}

session_namespace: {{ session_namespace }}

workshop_namespace: {{ workshop_namespace }}

training_portal: {{ training_portal }}

ingress_domain: {{ ingress_domain }}

ingress_protocol: {{ ingress_protocol }}

#### Web site links

[Manage Clusters](https://tanzuemea.tmc.cloud.vmware.com/clusters)
