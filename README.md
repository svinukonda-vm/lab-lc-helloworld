LAB - Hello World Sample
=====================

Sample workshop content using Markdown formatting for pages.

If you already have the Educates operator installed and configured, to
deploy and view this sample workshop, run:

```
kubectl apply -f https://raw.githubusercontent.com/chdubois/lab-hello-world/master/resources/workshop.yaml
kubectl apply -f https://raw.githubusercontent.com/chdubois/lab-hello-world/master/resources/training-portal.yaml
```

This will deploy a training portal hosting just this workshop. To get the
URL for accessing the training portal run:

```
kubectl get trainingportal/lab-hello-world-sample
```

The training portal is configured to allow anonymous access. For your own
workshop content you should consider removing anonymous access.
