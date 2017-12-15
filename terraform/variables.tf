variable "aws_region" {
  default = "us-east-1"
}

variable "user_data" {
  default = "user_data.sh"
}

variable "ami_id" {
  default = "ami-c998b6b2"
}

variable "iam_role" {
  default = "ec2-autoscale"
}
