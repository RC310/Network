variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-west-2"
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "101.1.0.0/16"
}

variable "RP-public_subnet" {
    description = "CIDR for the Public Subnet"
    default = "101.2.0.0/24"
}

variable "RP-private_subnet" {
    description = "CIDR for the Private Subnet"
    default = "101.3.1.0/24"
}
