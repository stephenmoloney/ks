# Kubernetes series part 1

The objective here is to migrate `kubernetes/ks1` to a helm based deployment.

## Create the charts folder

1. Navigate to `helm/ks1`

```sbtshell
cd ks/helm/ks1
```

2. Create starting point helm templates

```shell
helm create ks1
```

- tree of created files 

```shell
helm/ks1
├── app
│   ├── node_modules
│   ├── package.json
│   ├── public
│   ├── README.md
│   ├── src
│   └── yarn.lock
├── charts
├── Chart.yaml
├── images
│   └── app.png
├── ks1-helm.md
├── templates
│   ├── deployment.yaml
│   ├── _helpers.tpl
│   ├── ingress.yaml
│   ├── NOTES.txt
│   └── service.yaml
├── values.yaml
└── web
    └── Dockerfile
``` 
 
3. delete some of the template files

```shell
rm helm/ks1/templates/deployment.yaml && \
rm helm/ks1/templates/service.yaml && \
rm helm/ks1/templates/ingress.yaml && \
rm helm/ks1/templates/NOTES.txt
```

- tree of remaining files

```shell
helm/ks1
├── app
│   ├── node_modules
│   ├── package.json
│   ├── public
│   ├── README.md
│   ├── src
│   └── yarn.lock
├── charts
├── Chart.yaml
├── images
│   └── app.png
├── ks1-helm.md
├── templates
│   ├── _helpers.tpl
├── values.yaml
└── web
    └── Dockerfile
```

4. Create new `service.yaml`, `deployment.yaml` and `ingress.yaml` template files.

5. Update the `values.yaml` file to fulfill the expectations of the template files

6. use helm to launch/create the pods

- from the helm/ks1 directory:

```shell
helm install deployment/ks1/ --name ks1 
```

