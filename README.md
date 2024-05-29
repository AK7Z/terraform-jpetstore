# terraform-jpetstore

## About This Repository
This repository contains a Java application - JPetStore - and the accompanying automation to deploy the application to an EC2 instance.

This repository is intended to be cloned and resources within provisioned from within a Jenkins pipeline - see [this pipeline](https://github.com/AK7Z/terraform-jenkins/blob/main/files/Jenkinsfile) as an example.

We deploy the application to the app subnet provisioned within the [terraform-jenkins](https://github.com/AK7Z/terraform-jenkins) repository.

As such this repository uses the Terraform state of the `terraform-jenkins` to fetch certain outputs that are required as part of provisioning resource within this repository.

Depending on how you created your bucket to hold the `terraform-jenkins` state - whether you created a lock or not - you may need to update `jenkins_state` in `remote-state.tf` accordingly.

## Requirements

* Have stored the Terraform state of `terraform-jenkins` in S3. Place the name of this bucket and name of the lock table in your `terraform.tfvars`; see next section.
* An ssh key-pair available in AWS. Place name of this key-pair in your `terraform.tfvars`; see next section.

## Example terraform.tfvars

Modify the existing `terraform.tfvars` file to assign values to the following variables:
```
project_name                = "project-name"
project_owner               = "my-name"
ami_key_pair_name           = "my-keypair-name"
# Taken from terraform-jenkins
terraform_state_bucket_name = "project-terraform-state-bucket-name"
# Taken from terraform-jenkins
dynamodb_table_name         = "project-terraform-state-lock-table"
```

## Provision

You can `git clone` and `terraform apply` this repository, however as specified in the first section of this readme, this repository is intended to be provisioned within a Jenkins pipeline.
