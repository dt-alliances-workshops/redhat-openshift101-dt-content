## CLI Steps (Optional)

## Let's point OpenShift to an existing built container image

Verify you're still in the project we created at the end of the last lab by going to the terminal and typing the following:  

```bash
$ oc projects
```

You should see something *similar* in the last line of the output:

```bash
$ Using project "demo-0" on server "https://172.30.0.1:443".
```

If you don't, use the following command to use the correct project:

```bash
$ oc project demo-0
```

In the terminal and type the following:

```bash
$ oc new-app sonatype/nexus:oss
```

The output should show something *similar* to below:

```bash
--> Found container image ae52f07 (4 months old) from Docker Hub for "sonatype/nexus:oss"

    Red Hat Universal Base Image 7
    ------------------------------
    The Universal Base Image is designed and engineered to be the base layer for all of your 
containerized applications, middleware and utilities. This base image is freely redistributable, 
but Red Hat only supports Red Hat technologies through subscriptions for Red Hat products. 
This image is maintained by Red Hat and updated regularly.

    Tags: base rhel7

    * An image stream tag will be created as "nexus:oss" that will track this image

--> Creating resources ...
    imagestream.image.openshift.io "nexus" created
    deployment.apps "nexus" created
    service "nexus" created
--> Success
    Application is not exposed. You can expose services to the outside world by executing one or 
more of the commands below:
     'oc expose svc/nexus'
    Run 'oc status' to view your app.  
```

Now, let's create a route, so that you can get to the app:

```bash
$ oc expose svc/nexus
```


