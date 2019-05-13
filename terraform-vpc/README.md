# terraform-aws-vpc

This repository contains a [Terraform][] project that builds : VPC
with Public and Private Subnets] and associates the Subnets to the route tables.

## Usage

`terraform.tfvars` holds variables which should be overriden with valid ones.

### Plan

```
terraform plan -var-file terraform.tfvars
```

### Apply

```
terraform apply -var-file terraform.tfvars
```

#### Destroy

```
terraform destroy -var-file terraform.tfvars
```

