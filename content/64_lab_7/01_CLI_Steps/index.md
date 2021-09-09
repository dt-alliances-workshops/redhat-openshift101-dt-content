## CLI Steps (Optional)

## Replication
Let's walk through a simple example of how the replication controller can keep your deployment at a desired state.  Assuming you still have the dc-metro-map project running we can manually scale up our replicas to handle increased user load.


1. Goto the terminal and try the following:

    ```bash
    $ oc scale --replicas=4 dc/dc-metro-map
    ```

1. Check out the new pods:

    ```bash
    $ oc get pods
    ```

    _Notice that you now have 4 unique pods available to inspect.  If you want go ahead and inspect them, using ```oc describe pod/<POD_NAME>```. You can see that each has its own IP address and logs._

So you've told OpenShift that you'd like to maintain 4 running, load-balanced, instances of our web app.

## Recovery
Okay, now that we have a slightly more interesting replication state, we can test a service outages scenario. In this scenario, the dc-metro-map replication controller will ensure that other pods are created to replace those that become unhealthy.  Let's forcibly inflict an issue and see how OpenShift responds.


- Choose a random pod and delete it:

    ```bash
    $ oc get pods
    $ oc delete pod/PODNAME
    $ oc get pods -w
    ```

If you're fast enough you'll see the pod you deleted go "Terminating" and you'll also see a new pod immediately get created and transition from "Pending" to "Running".  If you weren't fast enough you can see that your old pod is gone and a new pod is in the list with an age of only a few seconds.

- You can see the more details about your deployment configuration with:

    ```bash
    $ oc describe dc/dc-metro-map
    ```

## Application Health
In addition to the health of your application's pods, OpenShift will watch the containers inside those pods.  Let's forcibly inflict some issues and see how OpenShift responds.  


- Choose a running pod and shell into it:

    ```bash
    $ oc get pods
    $ oc exec PODNAME -it -- /bin/bash
    ```

You are now executing a bash shell running in the container of the pod.  Let's kill our webapp and see what happens.

#### 💥 **TECHNICAL NOTE**
_If we had multiple containers in the pod we could use "-c CONTAINER_NAME" to select the right one_

- Choose a running pod and shell into its container:

    ```bash
    $ pkill -9 node
    ```

This will kick you out off the container with an error like ```Error executing command in container```

Do it again - shell in and execute the same command to kill node

- Watch for the container restart

    ```bash
    $ oc get pods -w
    ```

If a container dies multiple times quickly, OpenShift is going to put the pod in a CrashBackOff state.  This ensures the system doesn't waste resources trying to restart containers that are continuously crashing.
