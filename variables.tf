variable "aws_access_key" {
  description = "The AWS access key."
}

variable "aws_secret_key" {
  description = "The AWS secret key."
}

variable "region" {
  description = "The AWS region to create resources in."
  default = "us-east-1"
}

variable "availability_zone" {
  description = "The AWS availability zones to create resources in."
  default = "us-east-1b"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.128.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.128.0.0/24"
}

variable "ecs_cluster_name" {
  description = "The name of the Amazon ECS cluster."
  default = "default"
}

variable "s3_bucket_name" {
  description = "The name of the s3 bucket to store the registry data in."
  default = "rxacevedo-s3-docker-registry"
}

variable "registry_username" {
  description = "The username to use when connecting to the registry."
  default = "Registry"
}

variable "registry_docker_image" {
  description = "The docker image to use when provisioning the registry."
  default     = "allingeek/registry:2-s3"
}

/* ECS optimized AMIs per region */
variable "amis" {
  default = {
    ap-northeast-1 = "ami-8aa61c8a"
    ap-southeast-2 = "ami-5ddc9f67"
    eu-west-1      = "ami-2aaef35d"
    us-east-1      = "ami-5943023c"
    us-west-1      = "ami-bdc006f9"
    us-west-2      = "ami-c0b257f3"
  }
}

variable "instance_type" {
  default = "t2.small"
}

variable "key_name" {
  description = "The aws ssh key name."
  default = ""
}

variable "key_file" {
  description = "The ssh public key for using with the cloud provider."
  default = ""
}
