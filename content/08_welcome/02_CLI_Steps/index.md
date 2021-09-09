## Accessing OpenShift through the CLI
In addition to the web console we previously used, you can utilize a command line tool to perform tasks.

## Using the command line (CLI)

1. Use your existing Butterfly terminal login following command:

    ```bash
    $ oc login
    ```

1. Using the same username/password combination as before, finish authenticating to the CLI

    ```bash
    Authentication required for https://console-openshift-console.apps.example.alliances.dynatracelabs.com (openshift)
    Username: kubeadmin
    Password:
    Login successful.
    ```

1. Check to see what projects you have access to:

    ```bash
    $ oc get projects
    ```
    _You will see ~64 projects including the "terminal-0" project_

## Use the CLI to create a new project

1. Use the CLI to create and use a new project by typing the following command to create and use the project "demo-0"

    ```bash
    $ oc new-project demo-0
    ```
1. Type the following command to show services, deployment configs, build configurations, and active deployments (this will come in handy later):

    ```bash
    $ oc status
    ```
