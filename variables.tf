variable "Backend_ami_id" {
  default = "ami-032eac5eeff6336de"
}

variable "Backend_instance_type" {
  default = "t3a.medium"
}

variable "Backend_securitygroup_id" {
  default = ["aws_security_group.qa-ami-demo.id"]
}


variable "Backend_pem_keyname" {
  default = "demo-ami"
}

variable "Backend_Attached_instance_profile" {
  default = "ec2-full-access"
}
