In this section, we will get some knowledge on TMC 

#### Follow the below steps to get API Token from TMC console

```dashboard:open-url
url: https://console.cloud.vmware.com/csp/gateway/discovery
```

![TMC Account page](images/tmc-1.png)

![TMC API Token](images/TMC-2.png)

![TMC Generate API Token](images/TMC-3.png)

![TMC Token](images/TMC-4.png)

```execute
tmc login -n test-demoworkshop --no-configure
```

```execute
tmc system context configure -l "log" -m tkg-mgmttest-cluster
```
```execute
tmc managementcluster list
```

```execute
tmc managementcluster get tkg-mgmttest-cluster
```

Navigate to TMC console > Administration > Management clusters > click on tkg-mgmttest-cluster

```dashboard:open-url
url: https://console.cloud.vmware.com/csp/gateway/discovery
```
```execute
tmc cluster attach -g default -n test-tmcattach -m tkg-mgmttest-cluster -p Eknath --kubeconfig ~/.kube/config-tkg
```

Navigate to  TMC console > Clusters > click on clustername

![TMC Cluster console](images/TMC-5.png)
