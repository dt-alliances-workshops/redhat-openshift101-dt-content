## Lab 5 Webhooks and Rollbacks (Optional)

# Build Triggers, Webhooks and Rollbacks - Oh My!
Once you have an app deployed in OpenShift you can take advantage of some continuous capabilities that help to enable DevOps and automate your management process.  We will cover some of those in this lab: Build triggers, webhooks, and rollbacks.


## A bit of configuration
We are going to do some integration and coding with an external git repository.  For this lab we are going to use github, if you don't already have an account, [you can create one here][1].

OK, let's fork the dc-metro-map app from **my** account into **your** github account.  Goto [https://github.com/RedHatGov/openshift-workshops][2] and look to the top right for the "Fork" button.

<img src="../../assets/images/ocp-lab-rollbacks-fork.png" width="500"><br/>

> Click the "Fork" button

Github should redirect you to the newly created fork of the source code.

## Build Trigger / Code Change Webhook
When using S2I there are a few different things that can be used to [trigger] a rebuild of your source code.  The first is a configuration change, the second is an image change, and the last (which we are covering here) is a webhook.  A webhook is basically your git source code repository telling OpenShift that the code we care about has changed.  Let's set that up for our project now to see it in action.

Jump back to your OpenShift web console and let's add the webapp to our project.  You should know how to do this from previous lab work, but this time point to *your* github URL for the source code.  If you need a refresher follow the steps below or just skip to the next section

<blockquote>
Click the "Add to Project" button
</blockquote>
<img src="../../../assets/images/ocp-addToProjectButton.png" width="400"><br/>
<br>
<blockquote>
Select the "From Git" icon
</blockquote>


Make sure that you replace <b>YOUR_ACCOUNT</b> with your GitHub user ID. Click on the "Show Advanced Git Options" expander to fill in the "Context Dir" field:


<table>
<tr><td><b>Git Repo URL</b></td><td>https://github.com/<b>YOUR_ACCOUNT</b>/openshift-workshops.git</td></tr>
<tr><td><b>Context Dir</b></td><td>dc-metro-map</td></tr>
</table>

<br>

<blockquote>
Select Node.js
</blockquote>


<table>
<tr><td><b>Application Name</b></td><td>dc-metro-map</td></tr>
<tr><td><b>Name</b></td><td>dc-metro-map</td></tr>
</table>


<blockquote>
Select "Deployment Configuration"
</blockquote>

<blockquote>
When you are done, scroll to the bottom and click 'Create'
</blockquote>