In this section, lets see the procedure to push packages(catalog) from TMC cli and console. 

```dashboard:open-url
https://docs.vmware.com/en/VMware-Tanzu-Mission-Control/services/tanzumc-using/GUID-EF35646D-8762-41F1-95E5-D2F35ED71BA1.html
```
#### Install cert-manager Package using TMC CLI: 

Navigate to TMC console > Catalog > select cluster {{ session_namespace }} from drop down and click on cert-manager

![TMC install package](images/TMC-6.png)

Click on Install Package which can be found on top right side of the page

![TMC install package](images/TMC-7.png)

Name the Installed package name as : {{ session_namespace }}-certm and click NEXT

![TMC install package](images/TMC-8.png)

Leave to Default and click NEXT

Install Package

```execute
kubectl get pods -n cert-manager
```

Navigate to TMC console > Catalog > Installed > check if the package (cert-manager.tanzu.vmware.com) is succeeded and healthy

![TMC Cluster console](images/TMC-9.png)


#### Install Contour Package using TMC CLI: 

Navigate to TMC console > Catalog > select cluster {{ session_namespace }} from drop down and click on Contour

![TMC Cluster console](images/TMC-10.png)

Click on Install Package which can be found on top right side of the page

![TMC Cluster console](images/TMC-11.png)

Name the Installed package name as : {{ session_namespace }}-contour and click NEXT

![TMC Cluster console](images/TMC-12.png)

### Execute the command to see the config values in Terminal -2

```execute-2
cat ~/contour.yaml
```

![TMC Cluster console](images/TMC-13.png) 

Leave to Default and click NEXT

Install Package

![TMC Cluster console](images/TMC-14.png) 

```execute
kubectl get svc -n tanzu-system-ingress --kubeconfig ~/.kube/config-tkg
```

Navigate to TMC console > Catalog > Installed > check if the package (cert-manager.tanzu.vmware.com) is succeeded and healthy

#### Install Harbor Package using TMC CLI: 

Navigate to TMC console > Catalog > select cluster {{ session_namespace }} from drop down and click on Harbor

Click on Install Package which can be found on top right side of the page

Name the Installed package name as : {{ session_namespace }}-harbor and click NEXT

### Execute the command to see the config values in Terminal -2

```execute-2
cat ~/harbor.yaml
```

Leave to Default and click NEXT

Install Package
