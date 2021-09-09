## Accessing OpenShift through the Web Console
OpenShift provides a web console that allows you to perform various tasks via a web browser.

## Let's Login to the Web Console

1. Use your browser to navigate to the URI provided by your instructor and login with the user/password provided.

    ```bash
    "https://console-openshift-console.apps.example.alliances.dynatracelabs.com"
    ```

    ![image](../../assets/images/ocp-login.png)
    *Login Webpage*

1. Once you are logged in you should see the overview page for your cluster:

    ![image](../../assets/images/ocp-admin-default.png)
    *Administrator Default View*

## This is what an empty project looks like
First, let's create a new project to run a terminal application that we'll use for the rest of the workshop.

1. Click on "Projects" then the "Create Project" button and give it a name of terminal

1. Populate "Name" with "terminal" and populate the "Display Name" and "Description" boxes with whatever you like.  Click on "Create" to create the project.

    ![image](../../assets/images/ocp-admin-create-project.png)

1. This is going to take you to the next logical step of adding something to the project but we don't want to do that just yet.

## Let's deploy Butterfly (Browser-based SSH)

First, we need to change views from the "Administrator" view to the "Developer" view. There is a pop-up menu in the top left corner of the screen just below the menu (three horizontal lines) button.


1. Click "Administrator" and change it to "Developer"

    ![image](../../assets/images/ocp-menu-administrator.png")

1. Click "+Add" to add a new item to the project

    ![image](../../assets/images/ocp-addToProjectButton.png")

1. Click "Container Image" to add an existing image from the container registry

    ![image](../../assets/images/ocp-ContainerImageButton.png")

1. In the dialog box under the default radio button "Image name from external registry", enter "quay.io/openshifthomeroom/workshop-terminal".  The image should be "Validated" when found.

    ![image](../../assets/images/ocp-deploy-image.png)

1. Observe the default values that are populated in the search results.

    ![image](../../assets/images/ocp-butterfly-create-1.png)

1. Click "Create"


1. You will now see a screen that shows a thumbnail view of your deployed application. Click on "D workshop-termin..." to expand the screen and see the details of the running pod:

    ![image](../../assets/images/ocp-workshop-terminal-thumb.png)
    ![image](../../assets/images/ocp-butterfly-topology.png)
    "Topology"

## Test out the Butterfly webapp

1. Notice that in the web console overview, you now have a URL in the service box.  You can see the webapp running by clicking the exposed route.

    ![image](../../assets/images/ocp-butterfly-route.png)

1. After clicking on the URLa new browser window should open placing you into a terminal session.

    ![image](../../assets/images/butterfly-session.png)

1. Now, type the command `oc`.
