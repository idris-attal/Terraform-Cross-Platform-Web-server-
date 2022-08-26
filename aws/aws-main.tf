#Terraform Initiallization
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

#Initialize the AWS Provider
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}



#Define the security group for HTTP web server
resource "aws_security_group" "aws-web-sg" {
  name        = "${var.app_name}-${var.app_environment}-web-sg"
  description = "Allow incoming HTTP connections"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #ssh
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "${var.app_name}-${var.app_environment}-web-sg"
    Environment = var.app_environment
  }
}

#Create EC2 Instances for Web Server
resource "aws_instance" "aws-web-server" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  key_name                    = "terraform-web-server"
  vpc_security_group_ids      = [aws_security_group.aws-web-sg.id]
  associate_public_ip_address = true
  source_dest_check           = false

  user_data = file("./aws-user-data.sh")

  tags = {
    Name        = "${var.app_name}-${var.app_environment}-web-server"
    Environment = var.app_environment
  }
}

# output of generated ip
output "publicip" {
  value = aws_instance.aws-web-server.*.public_ip
}
