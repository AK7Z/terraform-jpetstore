data "terraform_remote_state" "jenkins_state" {
  backend = "s3"
  config = {
    bucket = var.terraform_state_bucket_name
    key    = "terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = var.dynamodb_table_name
  }
}

locals {
    test-env-vpc-id = data.terraform_remote_state.jenkins_state.outputs.test-env-vpc-id
    app-subnet-id = data.terraform_remote_state.jenkins_state.outputs.app-subnet-id
}