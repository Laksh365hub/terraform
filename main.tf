resource "aws_instance" "myec2" {
    count = length(var.instance_names)
    ami = "ami-0b09ffb6d8b58ca91"
    instance_type = var.instance_names[count.index] == "mysql" ? "t2.small" : "t2.micro"

    vpc_security_group_ids = [aws_security_group.mysg.id]

    tags = {
        Name = var.instance_names[count.index]
        Environment = "Dev"
    }
}


resource "aws_security_group" "mysg" {
    name = "myterraformsg"
    description = "ALLOW PORT NUMBER 22"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
      Name = "terraform"
      Environment = "Dev"
    }
  
}


resource "aws_instance" "localec2" {

    ami = "ami-0b09ffb6d8b58ca91"
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.mysg.id]

    tags = {
      Name = "local-terraform"
    }
  
}
