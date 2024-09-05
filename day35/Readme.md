# Day 35:

### In this task, I have deployed a Kubernetes application on AWS EC2 instances and set up a monitoring stack using Prometheus and Grafana. This project is designed to test the knowledge of deploying and configuring monitoring solutions in a Kubernetes environment on AWS

### For this task, First of all, I created 3 EC2 instances. One for control plane which was t2.medium and a couple for data plane which were t2.micro.

Make the 3 instance one of them is t2.medium in Control_plane  and other two are t2.micro dat plane.

![1725519832562](images/Readme/1725519832562.png)

![1725519928331](images/Readme/1725519928331.png)

![1725519950273](images/Readme/1725519950273.png)

![1725519959544](images/Readme/1725519959544.png)

![1725519973228](images/Readme/1725519973228.png)

![1725519986852](images/Readme/1725519986852.png)

![1725519997840](images/Readme/1725519997840.png)

![1725520011253](images/Readme/1725520011253.png)

![1725520028452](images/Readme/1725520028452.png)

![1725520041640](images/Readme/1725520041640.png)

Repeat the command in all the dataplane node and we found this.

![1725520057257](images/Readme/1725520057257.png)

If we done in comtrol plane it shows this.

```
kubectl get nodes
```

![1725520258619](images/Readme/1725520258619.png)

Now install Prometheus and Grafana using helm chart.


Install Prometheus:
![1725520450926](images/Readme/1725520450926.png)

![1725520458530](images/Readme/1725520458530.png)

![1725520474695](images/Readme/1725520474695.png)



![1725520487409](images/Readme/1725520487409.png)

![1725520494289](images/Readme/1725520494289.png)

Go to the browser and type https://localhost:9090


### Next, I installed grafana as using helm. For that, I ran the below given commands:

```
vi grafana-values.yml

adminPassword: password


kubectl create namespace grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana grafana/grafana -f ~/grafana-values.yml --namespace grafana
kubectl get all -n grafana

```

### To deploy a NodePort Service to Provide External Access to Grafana.

```
  helm install grafana grafana/grafana -f ~./grafana-values.yaml --namespave grafana
```

![1725520837229](images/Readme/1725520837229.png)

Now hit the ip and port number https://localhost:3000

![1725521022610](images/Readme/1725521022610.png)
