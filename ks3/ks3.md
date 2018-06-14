# Kubernetes series part 3

The objective here is to incorporate a python flask server and let our frontend make API calls to it.

Also, another objective is to clone the repository from git and use a mounted volume as the src for
the frontend code.

1. navigate to ks3

```shell
cd ~/dev/github/redgate/ks/ks3
```

2. build the web and server docker images


```shell
docker build --file ./web/Dockerfile --tag <your_namespace>/ks-frontend:v3 . && \
docker build --file ./server/Dockerfile --tag <your_namespace>/ks-backend:v3 . && \
docker login registry.<your_registry>.com && \
docker tag <your_namespace>/ks-frontend:v3 registry.<your_registry>.com/<your_namespace>/ks-frontend:v3 && \
docker tag <your_namespace>/ks-backend:v3 registry.<your_registry>.com/<your_namespace>/ks-backend:v3 && \
docker push registry.<your_registry>.com/<your_namespace>/ks-frontend:v3 && \
docker push registry.<your_registry>.com/<your_namespace>/ks-backend:v3
```

3. create deployment and service

```shell
kubectl create -f ./config/deployment.yaml
kubectl create -f ./config/service.yaml
kubectl create -f ./config/ingress.yaml
```

4. check app runs as expected

```shell
kubectl get pods
```

5. get all the logs for the containers

```shell
export POD=<pod-id>
kubectl logs -f ${POD} --container=ks3-init-repo
kubectl logs -f ${POD} --container=ks3-frontend
kubectl logs -f ${POD} --container=ks3-backend
```

6. service app with minikube

```shell
minikube service ks3web --url
```