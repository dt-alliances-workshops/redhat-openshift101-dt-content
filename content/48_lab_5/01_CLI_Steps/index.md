## CLI Steps (Optional)

## See the app in action and inspect some details
OpenShift provides traceability for your running deployment, back to the container image, and the registry that it came from. Additionally, images built by OpenShift are traceable back to the exact [branch](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-branches) and [commit](https://help.github.com/en/github/getting-started-with-github/github-glossary#commit). Let's take a look at that!


- Goto the terminal and type the following:

    ```bash
    $ oc status
    ```

    This is going to show the status of your current project.  In this case it will show the dc-metro-map service (svc) with a nested deployment config(also called a "DC") along with some more info that you can ignore for now.  
    
    _A deployment in OpenShift is a replication controller based on a user defined template called a deployment configuration_


The dc provides us details we care about to see where our application image comes from, so let's check it out in more detail.

- Type the following to find out more about our dc:

    ```bash
    $ oc describe deploymentconfig/dc-metro-map
    ```
    _Notice under the template section it lists the containers it wants to deploy along with the path to the container image._


There are a few other ways you could get to this information.  If you are feeling adventurous, you might also want to try to:

1. describe the replication controller
    - ```oc describe rc -l app=dc-metro-map```
1. describe the image stream
    - ```oc describe is -l app=dc-metro-map```
1. describe the running pods
    - ```oc describe pod```

Because we built this app using S2I, we get to see the details about the build - including the container image that was used for building the source code.  So let's find out where the image came from.  Here are the steps to get more information about the build configuration (bc) and the builds themselves:

- Type the following to find out more about our bc:

    ```bash
    $ oc describe bc/dc-metro-map
    ```
    _Notice the information about the configuration of how this app gets built.  In particular look at the github URL, the webhooks you can use to automatically trigger a new build, the docker image where the build runs inside of, and the builds that have been completed._

New let's look at one of those builds:

- Type the following:

    ```bash
    $ oc describe build/dc-metro-map-1
    ```

    This shows us even more about the deployed container's build and source code, including exact commit information, for this build.  We can also see the commit's author, and the commit message.  You can inspect the code by opening a web browser and pointing it to a specific commit, like this:

    https://github.com/RedHatGov/redhatgov.github.io/commit/2d5078cc5bbdf3cf63c5ab15e1628f30b3c89954

## Pod logs
In the S2I lab we looked at a build log to inspect the process of turning source code into an image.  Now let's inspect the log for a running pod - in particular let's see the web application's logs.

1. Goto the terminal and type the following:

    ```bash
    $ oc get pods
    ```
    This is going to show basic details for all pods in this project (including the builders).  Let's look at the log for the pod running our application.  Look for the POD NAME that that is "Running" you will use it below.

1. Goto the terminal and type the following (replacing the POD NAME with your pod's name):

    ```bash
    $ oc logs [POD NAME]
    ```
    You will see in the output details of your app starting up and any status messages it has reported since it started.

    _You can see more details about the pod itself with ```oc describe pod/<POD NAME>```_


## How about we set some environment variables?
Whether it's a database name or a configuration variable, most applications make use of environment variables.  It's best not to bake these into your containers because they do change and you don't want to rebuild an image just to change an environment variable.  Good news!  You don't have to.  OpenShift let's you specify environment variables in your deployment configuration and they get passed along through the pod to the container.  Let's try doing that.


Let's have a little fun.  The app has some easter eggs that get triggered when certain environment variables are set to 'true'.

1. Goto the terminal and type the following:

    ```bash
    $ oc set env deploymentconfig/dc-metro-map -e BEERME=true
    ```

1. and then

    ```bash
    $ oc get pods -w
    ```

Due to the deployment config strategy being set to "Rolling" and the "ConfigChange" trigger being set, OpenShift auto deployed a new pod as soon as you updated the environment variable.  If you were quick enough, you might have seen this happening, with the ```oc get pods -w```  command

- Type Ctrl+C to stop watching the pods

_You can set environment variables, across all deployment configurations, with 'dc --all', instead of specifying a specific DC._

