# Kubernetes series part 3

The objective here is to incorporate a python flask server and let our frontend make API calls to it.

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

4. get web server logs

```shell
kubectl logs ks3web-1748674206-g14vb ks3webserver

* Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
* Restarting with stat
/usr/local/lib/python3.5/runpy.py:125: RuntimeWarning: 'flask.cli' found in sys.modules after import of package 'flask', but prior to execution of 'flask.cli'; this may result in unpredictable behaviour
warn(RuntimeWarning(msg))
* Debugger is active!
* Debugger PIN: 207-014-748
```


5. Call the web server from our frontend code

```shell
* navigate to `./app`
* we add a proxy to the `./app/package.json` file to `http://localhost:5000`
    `"proxy": "http://localhost:5000"`
* add fetch api to frontend
    `yarn add whatwg-fetch`
```

6. check app runs as expected

```shell
kubectl get pods
```

7. service app with minikube

```shell
minikube service ks3web --url
```