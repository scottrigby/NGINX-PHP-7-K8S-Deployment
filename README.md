NGINX PHP 7 K8S Deployment
--------------------------

What is this?
=============
A simple template for starting a PHP 7 application served by NGINX, using
 Kubernetes (K8S) deployment object. This also works with Minikube, to aid in
 learning how to use K8S on a local machine.

How does it work?
=================

### Locally via Minikube
1. Start [Minikube](https://github.com/kubernetes/minikube):

    ```bash
    $ minikube start
    Starting local Kubernetes cluster...
    Kubectl is now configured to use the cluster.
    ```
    **Optional:** Use xhyve driver for Docker instead of Virtualbox.

    - Follow Minikube documentation on [installing the xhyve driver](https://github.com/kubernetes/minikube/blob/master/DRIVERS.md#xhyve-driver).
    - Pass the `--vm-driver` argument to "Start Minikube".

        ```bash
        minikube start --vm-driver=xhyve
        ```
2. Create a K8S service:

    ```bash
    $ kubectl create -f resources/kubernetes/services/local-service.yaml
    service "local-service" created
    ```
3. Create a K8S deployment:

    ```bash
    $ ./scripts/create-deployment.sh \
      -p PHP7_IMAGE='rabellamy/php7:0.1.0' \
      -p NGINX_IMAGE='rabellamy/nginx:0.1.0' \
      -p HOSTPATH='/PATH/TO/LOCAL/REPO/NGINX-PHP-7-K8S-Deployment/src'
    deployment "local-deployment" created
    ```
4. Get the URL for the NGINX service that will serve your PHP 7 app:

    ```bash
    $ minikube service nginx-service --url
    ```
    Note, you may see this message until the pods are ready:
    > Waiting, endpoint for service is not ready yet...
5. [Clean up when you're done](https://www.youtube.com/watch?v=PJhXVg2QisM):

    ```bash
    $ minikube delete
    Deleting local Kubernetes cluster...
    Machine deleted.
    ````

Why?
====
We wanted an example of an NGINX and PHP 7 template using the Kubernetes
 deployment object, and straight K8S configs, but to our knowledge none
 previously existed. Here you go!

 For a templatized solution, consider [Helm Charts](https://github.com/kubernetes/charts).
