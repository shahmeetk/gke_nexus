#docker build -t shahmeetk/nexus_demo .
#docker push shahmeetk/nexus_demo
cd terraform
#terraform init
terraform apply --auto-approve
cd ..
kubectl create -f deploy-nexus-kubernetes.yaml
