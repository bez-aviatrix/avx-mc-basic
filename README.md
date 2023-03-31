This repo provide a terraform code to create Aviatrix Transit Firenet in AWS. 

Here are the components created
- Aviatrix Transit GW
- Aviatrix Spoke GW
- Transit to spoke attachement

The following example tfvars can be used for deploying this MCNA.
```
name        = "DAL"                     // Name prefix
cloud       = "azure"                   // CSP
region      = "East US"                 // Region
cidr        = "10.132.0.0/16"           // CIDR used to get cidr for transit and spoke vpc
account     = "bz-azure"                // CSP account
ha          = false                     // enable/disable ha gateway
```
Save the above variables and values as testing.tfvars file and pass it to plan and apply
```
terraform init
terraform plan -var-file=testing.tfvars
terraform apply -var-file=testing.tfvars
```