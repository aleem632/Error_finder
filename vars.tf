variable "REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-02f3f602d23f1659d"
  }
}



variable "ZONE" {
  default = "us-east-1a"

}

variable "name" {
  default = "ec2-user"
}
