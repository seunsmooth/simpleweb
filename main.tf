provider "aws" {
  region = "eu-west-1"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key"
}

resource "aws_instance" "app_server" {
       ami                         = var.AMI_ID
       associate_public_ip_address = true
       instance_type               = var.instance_type
       #availability_zone           = "eu-west-1a"
       security_groups              = ["${aws_security_group.terraform-sg.name}"]
       subnet_id                    = "subnet-0ffbe71882deab7b5"
       key_name                    = "belgium2"
       user_data = file("install_nginx.sh")
	   
	   tags = {
         Name = "Simple_html_server"
       }
}

output "ip" {
  value = "http://${aws_instance.app_server.public_ip}:8080 To connect ssh -i belgium2.pem ec2-user@${aws_instance.app_server.public_ip}"
}