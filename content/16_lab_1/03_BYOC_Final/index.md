## BYO Container Wrap-up

## We can browse our project details with the command line
Try typing the following to see what is available to 'get':

```bash
$ oc project demo-0
$ oc get all
```

Now let's look at what our image stream has in it:

```bash
$ oc get is
```
```bash
$ oc describe is/nexus
```

#### 💥 **TECHNICAL NOTE**
_An image stream can be used to automatically perform an action, such as updating a deployment, when a new image, in our case a new version of the nexus image, is created._


The app is running in a pod, let's look at that:

```bash
$ oc describe pods
```

## We can see those details using the web console too
Let's look at the image stream.  


1. Click on "Developer", in the top left corner, and change it to "Administrator"

    <img src="../../assets/images/ocp-menu-administrator.png" width="300">
1. Click on "Builds", in the left-side menu, and then "Image Streams"

    <img src="../../assets/images/ocp-nexus-buildimages.png" width="227">
1. This shows a list of all image streams within the project.  

1. Now click on the "nexus" image stream

1. You should see something similar to this:

    <img src="../../assets/images/ocp-nexus-is.png" width="600">

## Test out the nexus webapp

1. Change the context menu (the menu, in the top left, that contains "Administrator" and "Developer" back to "Developer", and click on the arrow, at the top right of the "nexus" thumbnail, to open the webapp's route.

    <img src="../../assets/images/ocp-nexus-thumbnail.png" width="125">
1. You will get a new browser window or tab, containing the following:

    <img src="../../assets/images/ocp-nexus-app.png" width="300">
1. Good work - this error is expected; since the nexus console is on /nexus

1. Simply append /nexus to the end of the URL in your browser to get the Nexus console.  Of course, we have not provided persistent storage; so, any and all work will be lost. *Please note: If for some reason you get the message "Application is not available," try manually specifying `http://` in the nexus URL.*


    <img src="../../assets/images/ocp-nexus-app2.png" width="600">

## Let's clean this up

Let's clean up all this to get ready for the next lab:

```bash
$ oc delete all --selector app=nexus
```
# Summary
In this lab you've deployed an example container image, pulled from Quay.io, into a pod running in OpenShift.  You exposed a route for clients to access that service via thier web browsers.  And you learned how to get and describe resources using the command line and the web console.  Hopefully, this basic lab also helped to get you familiar with using the CLI and navigating within the web console.