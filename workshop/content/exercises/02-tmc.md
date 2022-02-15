In this section, we will get some knowledge on TMC 

#### Follow the below steps to get API Token from TMC console

```dashboard:open-url
url: https://console.cloud.vmware.com/csp/gateway/discovery
```

![TMC Account page](images/tmc-1.png)

![TMC API Token](images/TMC-2.png)

![TMC Generate API Token](images/TMC-3.png)

##### Copy the token and save it for later use ####

![TMC Token](images/TMC-4.png)

```execute
tmc login -n partnerse-demo --no-configure
```

```execute
tmc system context configure -l "log" -m partnerse-demo-mgmt
```

```execute
tmc managementcluster list
```

```execute
tmc managementcluster get partnerse-demo-mgmt
```

Navigate to TMC console > Administration > Management clusters > click on partnerse-demo-mgmt

```dashboard:open-url
url: https://console.cloud.vmware.com/csp/gateway/discovery
```

Attach the workload cluster using TMC CLI

```execute
tmc cluster attach -g default -n {{ session_namespace }} -m partnerse-demo-mgmt -p demouser --kubeconfig ~/.kube/config-tkg
```

Navigate to  TMC console > Clusters > click on clustername

![TMC Cluster console](images/TMC-5.png)

```execute
tmc cluster validate --kubeconfig ~/.kube/config-tkg
```
