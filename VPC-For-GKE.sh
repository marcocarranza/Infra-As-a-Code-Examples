#############################################################
## This Deployment is for the following scenario.          ##
## 1.- Create a New Project for Networking Management      ##
## 2.- Create a VPC for GKE on an existing project with    ##
## secondary ranges for pods and services, we are also     ##
## activating the Private Google Access and the VPC Flow   ##
## Logs.                                                   ##
## 3.- Create a new project for the GKE Private Cluster.   ##
## 3.-                                                     ##
## Y.-                                                     ##
## Z.-                                                     ##
## A.-                                                     ##
## B.-                                                     ##
## C.-                                                     ##
#############################################################

#############################################################
## Step 1                                                  ##
## 1.a Create the host project for the Shared VPC          ##
## 1.b Attach the Billing ID to the created project        ##
#############################################################

gcloud projects create host-project-for-nw-gke
gcloud alpha billing projects link host-project-for-nw-gke --billing-account 0X0X0X-0X0X0X-0X0X0X

##############################################################
## Step 2                                                   ##
## 2.a Create a new VPC for being used for GKE              ##
## 2.b Create the subnet for nodes (/20), pods (/16)        ##
## and services (/20) on region us-west4                    ##
##############################################################

gcloud compute networks create nw-prd-gke-shared-vpc --project=nw-prd-gke-vpc --subnet-mode=custom --bgp-routing-mode=regional

gcloud compute networks subnets create shared-gke-prd-us-west4-subnet \
 --project=nw-prd-gke-vpc \
 --range=10.0.64.0/20 \
 --network=nw-prd-gke-shared-vpc \
 --region=us-west4 \
 --secondary-range nw-prd-gke-pods=10.4.0.0/16,nw-prd-gke-services=10.0.32.0/20 \
 --enable-private-ip-google-access \
 --enable-flow-logs \
 --logging-aggregation-interval=interval-5-sec \
 --logging-flow-sampling=0.5 \
 --logging-metadata=include-all

#############################################################
## Step 3                                                  ##
## 3.a Create the host project for the Shared VPC          ##
## 1.b Attach the Billing ID to the created project        ##
#############################################################

gcloud projects create attached-project-for-gke1