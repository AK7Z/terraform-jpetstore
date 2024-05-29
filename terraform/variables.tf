variable "ami_id" {
    type = string
    default = "ami-0843a4d6dc2130849"
}

variable "instance_type" {
    type = string
    default = "t2.medium"
}

variable "project_name" {
    type = string
}

variable "project_owner" {
    type = string
}

variable "ami_key_pair_name" {
    type = string
}

variable "terraform_state_bucket_name" {
    type = string
}

variable "dynamodb_table_name" {
    type = string
}