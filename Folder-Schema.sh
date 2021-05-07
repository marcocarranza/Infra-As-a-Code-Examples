#########################################
# Folder Creation at :
# Organization Level
# Sub Folder Level
# Create projects under Sub folders
#########################################
# Example Data
# Project ID = example-project-id
# Organization ID = 100000000000
# Organization Name = gcp.mydemo-org.domain
# Folder ID # 01 = 900000000001
# Folder ID # 02 = 900000000002
# Folder ID # 03 = 900000000003
# Folder ID # 04 = 900000000004
# Folder ID # 05 = 900000000005
# Folder ID # 06 = 300000000001
# Folder ID # 07 = 300000000002
# Folder ID # 08 = 300000000003
# Folder ID # 09 = 300000000004
#########################################

# Get organizarion ID
gcloud organizations list

# Output
# DISPLAY_NAME                             ID             DIRECTORY_CUSTOMER_ID
# gcp.mydemo-org.domain               100000000000              XXXXXXX

# Create Folder named "CL" at the Root Level of Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=CL \
   --organization=100000000000

# Create Folder named "PE" at the Root Level of Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=PE \
   --organization=100000000000

# Create Folder named "EC" at the Root Level of Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=EC \
   --organization=100000000000

# Create Folder named "CO" at the Root Level of Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=CO \
   --organization=100000000000

# Create Folder named "Regional Services" at the Root Level of Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=’Regional Services’ \
   --organization=100000000000

# Create Folder named "Regional Services" at the Root Level of Organization "gcp.mydemo-org.domain"
gcloud resource-manager folders list --organization 100000000000
DISPLAY_NAME       PARENT_NAME                           ID
CL                 organizations/100000000000  900000000001
PE                 organizations/100000000000  900000000002
EC                 organizations/100000000000  900000000003
CO                 organizations/100000000000  900000000004
Regional Services  organizations/100000000000  900000000005

# Create Folder named "NW" under the folder "CL" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=NW \
   --folder=900000000001

# Create Folder named "GCE" under the folder "CL" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=GCE \
   --folder=900000000001

# Create Folder named "GKE" under the folder "CL" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=GKE \
   --folder=900000000001

# Create Folder named "DATA" under the folder "CL" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=DATA \
   --folder=900000000001

# Create Folder named "NW" under the folder "Regional Services" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=NW \
   --folder=900000000005

# Create Folder named "GCE" under the folder "Regional Services" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=GCE \
   --folder=900000000005

# Create Folder named "GKE" under the folder "Regional Services" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=GKE \
   --folder=900000000005

# Create Folder named "DATA" under the folder "Regional Services" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=DATA \
   --folder=900000000005

#
gcloud resource-manager folders list --folder 900000000001
DISPLAY_NAME  PARENT_NAME                     ID
NW            folders/900000000001  300000000001
GKE           folders/900000000001  300000000002
GCE           folders/900000000001  300000000003
DATA          folders/900000000001  300000000004

# Create Folder called "DEV" for Development environment under the
# folder "CL/NW" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=DEV \
   --folder=300000000001

# Create Folder called "QA" for Quality environment under the
# folder "CL/NW" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=QA \
   --folder=300000000001

# Create Folder called "PROD" for Production environment under the
# folder "CL/NW" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=PROD \
   --folder=300000000001

# Create Folder called "DEV" for Development environment under the
# folder "CL/GKE" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=DEV \
   --folder=300000000002

# Create Folder called "DEV" for Development environment under the
# folder "CL/GKE" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=QA \
   --folder=300000000002

# Create Folder called "DEV" for Development environment under the
# folder "CL/GKE" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=PROD \
   --folder=300000000002

# Create Folder called "DEV" for Development environment under the
# folder "CL/GCE" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=DEV \
   --folder=300000000003

# Create Folder called "DEV" for Development environment under the
# folder "CL/GCE" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=QA \
   --folder=300000000003

# Create Folder called "DEV" for Development environment under the
# folder "CL/GCE" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=PROD \
   --folder=300000000003

# Create Folder called "DEV" for Development environment under the
# folder "CL/DATA" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=DEV \
   --folder=300000000004

# Create Folder called "DEV" for Development environment under the
# folder "CL/DATA" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=QA \
   --folder=300000000004

# Create Folder called "DEV" for Development environment under the
# folder "CL/DATA" of the Organization "gcp.mydemo-org.domain"
gcloud alpha resource-manager folders create \
   --display-name=PROD \
   --folder=300000000004


# Create all the projects using Cloud SDK
# under folder called "CL/NW" of the Organization "gcp.mydemo-org.domain"
gcloud projects create cl-core-nw --folder=300000000001
gcloud projects create cl-dev-nw --folder=300000000001
gcloud projects create cl-qa-nw --folder=300000000001
gcloud projects create cl-prod-nw --folder=300000000001

# Add the Billing Account to the recently created projects
# List Billing Accounts
gcloud alpha billing accounts list

# Example Output
# XXXXXXX@cloudshell:~ (xxxxx-xxx-xxx)$ gcloud alpha billing accounts list
# ACCOUNT_ID            NAME              OPEN  MASTER_ACCOUNT_ID
# 0Y0Y0Y-0Y0Y0Y-0Y0Y0Y  Billing1
# 0X0X0X-0X0X0X-0X0X0X  Billing2          True

# Once selected the Billing Account to being used, execute the following
# command to associate the desired Billing Account to the project.
# the parameter "example-project-id"
gcloud alpha billing projects link example-project-id --billing-account 0X0X0X-0X0X0X-0X0X0X

# Example Output
# XXXXXXX@cloudshell:~ (xxxxx-xxx-xxx)$ gcloud alpha billing projects link example-project-id --billing-account 0X0X0X-0X0X0X-0X0X0X
# billingAccountName: billingAccounts/0X0X0X-0X0X0X-0X0X0X
# billingEnabled: true
# name: projects/example-project-id/billingInfo
# projectId: example-project-id
# XXXXXXX@cloudshell:~ (xxxxx-xxx-xxx)$
