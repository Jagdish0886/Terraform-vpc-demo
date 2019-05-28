provider "aws" {
  access_key = "AKIARCUR6AI7TPOSPJCY"
  secret_key = "MEi+EegqxjYNmOKDGZCevqzptZA4qayIW+qsyK1t"
  region     = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0e7e244dcf61f05bd"
  instance_type = "t2.micro"
  key_name = "Darshana-Terraform"
  security_groups = ["${aws_security_group.allow_rdp.name}"]

}

resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allow rdp traffic"


  ingress {

    from_port   = 3389 #  By default, the windows server listens on TCP port 3389 for RDP
    to_port     = 3389
    protocol =   "tcp"

    cidr_blocks =  ["0.0.0.0/0"]
  }
}