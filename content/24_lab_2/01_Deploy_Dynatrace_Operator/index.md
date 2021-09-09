## Deploying Dynatrace Operator

Organizations will often customize the Dynatrace Operator installation and you can read more about the options in the [Dynatrace docs](https://www.dynatrace.com/support/help/technology-support/container-platforms/kubernetes/monitor-kubernetes-environments/) but, we are going to use a single command that we can get from the Dynatrace interface to show how easy it is to get started.

When we run this command, it will do the following:
* Create a namespace called `dynatrace` in your cluster will the Dynatrace Operator pods
* Set the OneAgent on each of the cluster nodes as to provide full-stack Dynatrace monitoring
* Create a Kubernetes dashboard that will be populated with the Kubernetes data pulled from the API
* Setup a Dynatrace ActiveGate that runs as a container in the `dynatrace` namespace that is used in the polling of Kubernetes API
* Enable preset out-of-the-box Kubernetes dashboards

## Install Dynatrace Operator

1. To navigate to OpenShift/Kubernetes page, follow these steps and refer to the picture below:

    1. Within Dynatrace, click on the `Deploy Dynatrace` menu item.
    1. Click on the `Start Installation` button
    1. Click on the `OpenShift` button

    ![image](../../assets/images/operator-menu.png)

1. To get the Dynatrace Operator installation command, refer to the steps and pictures below:

    1. On the Kubernetes configuration page, enter `openshift-workshop` for the name. This is not the cluster name, it will show up as the Kubernetes page name in Dynatrace
    1. Click the `Create tokens` button
    1. Select the `Skip SSL Certificate Check` to be ON
    1. Click the `Copy` button

    ![image](../../assets/images/k8s-easybutton.png)

1. Paste the command in Butterfly console and run it

1. Once the script is complete, then monitor the installation until you all pods are in `Running` state.

    ```
    oc -n dynatrace get pods
    ```

    Rerun the command (or use watch: `oc -n dynatrace get pods -w`) until the output looks like this:

    ```
    NAME                                  READY   STATUS    RESTARTS   AGE
    dynakube-classic-2rk9z                1/1     Running   0          2m14s
    dynakube-classic-4tlcj                1/1     Running   0          2m14s
    dynakube-classic-lz7r6                1/1     Running   0          2m14s
    dynakube-classic-m7z87                1/1     Running   0          2m14s
    dynakube-classic-tzcsl                1/1     Running   0          2m14s
    dynakube-classic-wm2h6                1/1     Running   0          2m14s
    dynakube-kubemon-0                    1/1     Running   0          2m22s
    dynakube-routing-0                    1/1     Running   0          2m14s
    dynatrace-operator-7cf8964786-7m9k2   1/1     Running   0          3m1s
    ```
## Configure Dynatrace Kubernetes events ingest

The above 