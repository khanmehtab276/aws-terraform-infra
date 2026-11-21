resource "aws_key_pair" "my_key" {
    key_name = "${var.env}-${var.key_name}"
    public_key = file("~/.ssh/id_ed25519.pub")
}

resource aws_default_vpc vpc {
}

resource aws_security_group sg {
    name = var.sg_name
    vpc_id = aws_default_vpc.vpc.id

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource aws_instance ec2_instance {
    count = var.instance_count
    ami = "ami-0625bef1ea02ae20c"
    instance_type = var.instance_type
    tags = {
        Name = "${var.env}-${var.instance_name}-${count.index + 1}"
        Environment = var.env
    }
}