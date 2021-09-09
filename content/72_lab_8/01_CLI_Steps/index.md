## CLI Steps (Optional)

## Labels on a pod
In a previous lab we added our web app using a S2I template.  When we did that, OpenShift labeled our objects for us.  Let's look at the labels on our running pod.

- Goto the terminal and try the following:

    ```bash
    $ oc get pods
    $ oc describe pod/dc-metro-map-4-v427r | grep Labels: --context=4
    Namespace:    demo-0
    Priority:     0
    Node:         ip-10-0-186-15.us-east-2.compute.internal/10.0.186.15
    Start Time:   Thu, 29 Jul 2021 19:33:13 +0000
    Labels:       app=dc-metro-map
                deployment=dc-metro-map-4
                deploymentconfig=dc-metro-map
    Annotations:  k8s.v1.cni.cncf.io/network-status:
                    [{
    ```

You can see the Labels automatically added contain the app, deployment, and deploymentconfig.  Let's add a new label to this pod.


1. Add a label

    ```bash
    $ oc label pod/<POD NAME> testyear=2021 testedby=me
    ```

1. Look at the labels

    ```bash
    $ oc describe pod/<POD NAME> | grep Labels: --context=4
    Namespace:    demo-0
    Priority:     0
    Node:         ip-10-0-186-15.us-east-2.compute.internal/10.0.186.15
    Start Time:   Thu, 29 Jul 2021 19:33:13 +0000
    Labels:       app=dc-metro-map
                deployment=dc-metro-map-4
                deploymentconfig=dc-metro-map
                testedby=me
                testyear=2021
    ```
