# gke_nexus
The goal of this exercise is to run a Nexus application on GCP Kubernetes that can save the uploaded artifacts in Cloud Storage. In your solution, follow the given order of the subtasks. Upload the finished files to the public GitHub and send us the repo. 


# Cloud Architect Exercise

# 1. Build Container

You don’t have to start from scratch. Nexus has an image already prepared here: https://hub.docker.com/r/sonatype/nexus3/
Nexus needs a plugin to write into Cloud Storage. You can find the description here: https://github.com/sonatype-nexus-community/nexus-blobstore-google-cloud

Create a Docker file, which makes an image where the Cloud Storage plugin is already properly installed. 

List of Commands to Run 

```
1. docker build -t shahmeetk/nexus_demo .
2. docker push shahmeetk/nexus_demo
```

# 2. Kubernetes configs

To deploy the previously created custom container to Kubernetes, we need a descriptor file. Make a yaml configuration file that lets you create the next units: Service, Persistence volume, Deployment. It’s a plus if you use a templating tool such as Helm or Kustomize.

List of Commands to Run 

```
1. kubectl create -f deploy-nexus-kubernetes.yaml
```

# 3.GCP resource creation
Please create Terraform or Deployment Manager scripts in order to create the Cloud Storage Bucket and the Kubernetes Cluster. To lower the costs please create a node-pool with 1 node and n1-standard-1 machine type and use preemptible VMs.

List of Commands to Run 

```
1. cd terraform
2. terraform init
3. terraform plan
4. terraform apply 
```

# 4. Deploy
  Deploy it to the provided GCP project. 

  List of Commands to Run 
  ```
  1. gcloud container clusters create nexus-cluster --num-nodes=1 --zone=us-central1-
  ```


# Continuous integration - a theoretical question
We might have to modify the previously created files, for example because of a new Nexus version. We want this to automatically be deployed to a test environment after we have made the changes on Git. 
Please describe in a few words how you would satisfy this need. 

# Answer:
We can create it by following steps.
```
1. Create Jenkins
2. Create Git WebHook and connect with jenkins
3. Create Jenkins Job 
4. Create trigger in job to run on each commit
5. Run the bash script on trigger of jenkins job : automated-script.sh
```
So basically by doing all above process it will all time run the build and perform few steps
1. Docker Build
2. Docker Push
3. Terraform Init, Plan and Deploy ( Within Terraform it trigger Helmfile to release the new version)

Following is the command to run this solution fully automated.
```
1. ./automated-script.sh
```