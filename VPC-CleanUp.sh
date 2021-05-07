##############################
## VPC Landing Zone Example ##
##############################

# Example Data
# Project ID = example-vpc-project-id

# This instructions delete the default firewall rules on the default VPC
gcloud compute firewall-rules delete default-allow-icmp --quiet
gcloud compute firewall-rules delete default-allow-internal --quiet
gcloud compute firewall-rules delete default-allow-rdp --quiet
gcloud compute firewall-rules delete default-allow-ssh --quiet

# This instruction delete the default VPC
gcloud compute networks delete default --quiet

# This instruction creates a new VPC called "nw-dev-gce-shared-vpc" on the project "example-vpc-project-id" (uses the project-id)
gcloud compute networks create nw-dev-gce-shared-vpc --project=example-vpc-project-id --subnet-mode=custom --bgp-routing-mode=regional

# This instruction creates a subnet called "shared-gce-dev-sa-east1-subnet" on the project "example-vpc-project-id"
# define the IP Range for the network "192.168.0.0/24" on the previously created VPC "nw-dev-gce-shared-vpc"
# define the region in this case "southamerica-east1"
# enable the private google access on the VPC [https://cloud.google.com/vpc/docs/configure-private-google-access]
# enable the VPC Flow Logs [https://cloud.google.com/vpc/docs/using-flow-logs]
# configure the logging aggregation and sampling frequency [https://cloud.google.com/vpc/docs/flow-logs#log-sampling]
# configure which type of metadata we are going to collect [https://cloud.google.com/vpc/docs/flow-logs#metadata]

gcloud compute networks subnets create shared-gce-dev-sa-east1-subnet \
 --project=example-vpc-project-id \
 --range=192.168.0.0/24 \
 --network=nw-dev-gce-shared-vpc \
 --region=southamerica-east1 \
 --enable-private-ip-google-access \
 --enable-flow-logs \
 --logging-aggregation-interval=interval-5-sec \
 --logging-flow-sampling=0.5 \
 --logging-metadata=include-all

# This instruction creates a subnet called "shared-gce-dev-us-west4-subnet" on the project "example-vpc-project-id"
# define the IP Range for the network "192.168.1.0/24" on the previously created VPC "nw-dev-gce-shared-vpc"
# define the region in this case "us-west4"
# enable the private google access on the VPC [https://cloud.google.com/vpc/docs/configure-private-google-access]
# enable the VPC Flow Logs [https://cloud.google.com/vpc/docs/using-flow-logs]
# configure the logging aggregation and sampling frequency [https://cloud.google.com/vpc/docs/flow-logs#log-sampling]
# configure which type of metadata we are going to collect [https://cloud.google.com/vpc/docs/flow-logs#metadata]

gcloud compute networks subnets create shared-gce-dev-us-west4-subnet \
 --project=example-vpc-project-id \
 --range=192.168.1.0/24 \
 --network=nw-dev-gce-shared-vpc \
 --region=us-west4 \
 --enable-private-ip-google-access \
 --enable-flow-logs \
 --logging-aggregation-interval=interval-5-sec \
 --logging-flow-sampling=0.5 \
 --logging-metadata=include-all

 # Create a Cloud Router

 # Create a Cloud NAT
 gcloud compute routers nats create NAT_CONFIG \
    --router=NAT_ROUTER \
    --auto-allocate-nat-external-ips \
    --nat-all-subnet-ip-ranges \
    --enable-logging


