# Terrform Code to create an EC2 instance with local-exec provisioner
provider "aws" {
  region = "ap-south-1"
}


resource "aws_security_group" "web-server-sg" {
    name        = "web-server-sg"
    description = "Allow HTTP and SSH traffic"

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
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }    
  
}



resource "aws_instance" "webserver" {
    ami           = "ami-0d176f79571d18a8f" # Amazon Linux 2 AMI
    instance_type = "t3.medium"
    key_name = "devops-batch-18-mumbai-key"
    vpc_security_group_ids = [aws_security_group.web-server-sg.id]
    
    tags = {
        Name = "WebServerInstance"
    }
    
        connection {
            type        = "ssh"
            user        = "ec2-user"
            host        = self.public_ip
            private_key = file("devops-batch-18-mumbai-key.pem")
            timeout     = "10m"
        }

        provisioner "remote-exec" {
            inline = [
                # give cloud-init and networking a short grace period
                "sleep 30",
                "sudo yum update -y",
                "sudo yum install -y httpd",
                "sudo systemctl start httpd",
                "sudo systemctl enable httpd",
                # use sudo tee so the redirection runs as root (avoid permission denied)
                "echo '<h1> Deployed via Terraform Remote Exec </h1>' | sudo tee /var/www/html/index.html > /dev/null"
            ]
        }
  
}