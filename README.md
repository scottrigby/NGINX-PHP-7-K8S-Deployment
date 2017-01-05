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
    Running pre-create checks...
    Creating machine...
    Starting local Kubernetes cluster...
    ```
2. Create a K8S service:

    ```bash
    $ kubectl create -f resources/kubernetes/services/local-service.yaml
    service "local-deployment" created
    ```
3. Create a K8S deployment:

    ```bash
    $ kubectl create -f resources/kubernetes/deployments/local-deployment.yaml
    deployment "local-deployment" created
    ```
4. Open the URL in your default browser:

    ```bash
    $ open $(minikube service local-deployment --url | sed -n 1p)
    ```
    Note, if you see a message:
    > Waiting, endpoint for service is not ready yet...

    Escape the above command with control-C.
5. [Clean up when you're done](https://www.youtube.com/watch?v=PJhXVg2QisM):

    ```bash
    $ minikube delete
    Deleting local Kubernetes cluster...
    Machine deleted.
    ````

Why?
====
Because it's awesome. Also, such a template does not currently exist according
 to Google. There are many tutorials and recipes that do some of this, but not
 all of it. This is probably because the Kubernetes deployment object is
 relatively new, and most people using it are either too experienced with K8S
 (or to busy) to bother creating a reusable template like this, or also (to be
 fair) are not the same people interested in developing stand alone PHP 7 apps
 served by NGINX.
