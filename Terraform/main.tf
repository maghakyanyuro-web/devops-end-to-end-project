provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "dev_sg" {
  name        = "yura-devops-sg-v3"
  description = "Allow SSH, Web, and Backend ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_servers" {
  count         = 2
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04
  instance_type = "t3.micro"
  key_name      = "gndak" 
  subnet_id	= "subnet-0a473241001687df6"
  associate_public_ip_address = true  
  vpc_security_group_ids = [aws_security_group.dev_sg.id]

  tags = {
    Name = "Yuro-Junior-Server-${count.index + 1}"
  }
}

resource "local_file" "ansible_inventory" {
  content  = <<EOT
[new_servers]
${join("\n", aws_instance.app_servers[*].public_ip)}

[new_servers:vars]
ansible_ssh_user=ubuntu
ansible_ssh_private_key_file=./my-key.pem
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOT
  filename = "../ansible/inventory.ini"
}

# 4. Արտածում ենք IP-ները տերմինալում
output "server_ips" {
  value = aws_instance.app_servers[*].public_ip
}
