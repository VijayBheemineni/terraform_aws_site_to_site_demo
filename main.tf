data "aws_eip" "cisco_csr_1000v" {
  id = var.eip_allocation_id
}


resource "aws_security_group" "cisco_csr_1000v" {
  name        = "cisco_csr_1000v_terraform"
  description = "Allow all traffic"
  vpc_id      = var.cgw_vpc_id

  ingress {
    description      = "Allow all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "cisco_csr_1000v_terraform"
  }
}


resource "aws_instance" "cisco_csr_1000v" {
  ami = var.cisco_csr_1000v_ami_id
  instance_type = var.instance_type
  key_name = var.ssh_key_name
  subnet_id = var.cgw_public_subnet_id
  vpc_security_group_ids = [aws_security_group.cisco_csr_1000v.id]
  user_data = templatefile(
                            "${path.module}/templates/cisco_ios.tftpl",
                            {
                              vpn_connection_id = var.vpn_connection_id
                              vpc_test_server_private_ip = var.vpc_test_server_private_ip
                              
                              tunnel1_preshared_key = var.tunnel1_preshared_key
                              tunnel1_aws_output_ip_address = var.tunnel1_aws_output_ip_address
                              tunnel1_aws_inside_ip_address = var.tunnel1_aws_inside_ip_address
                              tunnel1_cgw_inside_ip_address = var.tunnel1_cgw_inside_ip_address

                              tunnel2_preshared_key = var.tunnel2_preshared_key
                              tunnel2_aws_output_ip_address = var.tunnel2_aws_output_ip_address
                              tunnel2_aws_inside_ip_address = var.tunnel2_aws_inside_ip_address
                              tunnel2_cgw_inside_ip_address = var.tunnel2_cgw_inside_ip_address
                            }
              )
  tags = {
    Name = "cisco_csr_1000v_terraform"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.cisco_csr_1000v.id
  allocation_id = data.aws_eip.cisco_csr_1000v.id
}