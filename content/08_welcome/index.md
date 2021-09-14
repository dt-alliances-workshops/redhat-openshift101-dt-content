## Welcome to OpenShift and Dynatrace!
This lab provides a quick tour of the console to help you get familiar with the user interface along with some key terminology we will use in subsequent lab content.  If you are already familiar with the basics of OpenShift simply ensure you can login and create the project.

# What is OpenShift?
<img src="../../../assets/images/what-is-openshift.png">
OpenShift provides a consistent application development and deployment platform, regardless of the underlying infrastructure, and provides operations teams with a scalable, secure, and enterprise-grade application platform and unified container and cloud management capabilities.

# What is Dynatrace?
<img src="../../../assets/images/what-is-dynatrace.png">

Dynatrace is a holistic software intelligence platform that identifies, monitors and optimizes application performance, IT infrastructure and User experience for large organizations.​

​Dynatrace brings together a single source of truth across Operations, Development, Security and Business Intelligence. ​

Undergirded by key inputs that include what you expect; (Traces, Metrics and Logs) AND key intelligence derived in real time from ongoing learning about the topology, user behaviour, code, metadata and the network AND Levering inputs from CloudWatch and API integrations from opensource tools such as OpenTelemetry and Keptn.​

The platform integrates to and interconnects with over 560 supported technologies.​
# Key Terms
We will be using the following terms throughout the workshop labs so here are some basic definitions you should be familiar with.  You'll learn more terms along the way, but these are the basics to get you started.

* Container - Your software wrapped in a complete filesystem containing everything it needs to run
* Image - We are talking about docker images; read-only and used to create containers
* Image Stream - An image stream comprises one or more Docker images identified by tags. 
* Pod - One or more docker containers that run together
* Service - Provides a common DNS name to access a pod (or replicated set of pods)
* Project - A project is a group of services that are related logically
* Deployment - an update to your application triggered by a image change or config change
* Build - The process of turning your source code into a runnable image
* BuildConfig - configuration data that determines how to manage your build
* Route - a labeled and DNS mapped network path to a service from outside OpenShift
* Master - The foreman of the OpenShift architecture, the master schedules operations, watches for problems, and orchestrates everything
* Node - Where the compute happens, your software is run on nodes
* Operator - A method of packaging, deploying, and managing a Kubernetes-native application.

