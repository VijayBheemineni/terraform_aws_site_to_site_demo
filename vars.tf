variable "eip_allocation_id" {
  description = "EIP which will associated with Cisco CSR 1000v"
  default = ""
}

variable "cgw_vpc_id" {
  description = "VPC id which is on customer side of Site-to-Site side VPN connection. For this demo its default vpc."
  default = ""
}

variable "cisco_csr_1000v_ami_id" {
  description = "Cisco CSR 1000v AMI id"
  default = "ami-0762f25b0f583389d"
}

variable "instance_type" {
  description = "Cisco CSR 1000v EC2 instance type"
  default = "t2.medium"
}

variable "ssh_key_name" {
  description = "SSH key name to log into Cisco CSR 1000v EC2 instance"
  default = ""
}

variable "cgw_public_subnet_id" {
  description = "Public Subnet Id where CGW router will be launched"
  default = ""
}


variable "vpn_connection_id" {
  description = "VPN connection id"
  default = ""
}

variable "vpc_test_server_private_ip" {
  description = "This is a test EC2 server which needs to be launched on AWS side of VPC in site-to-site VPN connection. Cisco router will ping this instance which brings up the IPSec tunnel."
  default = ""
}

variable "tunnel1_preshared_key" {
  description = "Tunnel1 Preshared Key. We can find this information in VPN connection download configuration. Search for 'pre-shared-key address' in Downloaded configuration and copy value after word 'key'. "
  default = ""
}

variable "tunnel1_aws_output_ip_address" {
  description = "In AWS Console, click on VPN connections --> Tunnel Details --> Tunnel 1 Outside IP address."
  default = ""
}

variable "tunnel1_aws_inside_ip_address" {
  description = "In AWS Console, click on VPN connections --> Tunnel Details --> Tunnel 1 Inside IP CIDR. From this CIDR select the first address in this subnet. For example for 169.254.68.12/30 subnet first address is 169.254.68.13. You can use https://www.davidc.net/sites/default/subnets/subnets.html"
  default = ""
}

variable "tunnel1_cgw_inside_ip_address" {
  description = "In AWS Console, click on VPN connections --> Tunnel Details --> Tunnel 1 Inside IP CIDR. From this CIDR select the second address in this subnet. For example for 169.254.68.12/30 subnet second address is 169.254.68.14. You can use https://www.davidc.net/sites/default/subnets/subnets.html"
  default = ""
}

variable "tunnel2_preshared_key" {
  description = "Tunnel2 Preshared Key. We can find this information in VPN connection download configuration. Search for 'pre-shared-key address' in Downloaded configuration and copy value after word 'key'. "
  default = ""
}

variable "tunnel2_aws_output_ip_address" {
  description = "In AWS Console, click on VPN connections --> Tunnel Details --> Tunnel 2 Outside IP address."
  default = ""
}

variable "tunnel2_aws_inside_ip_address" {
  description = "In AWS Console, click on VPN connections --> Tunnel Details --> Tunnel 2 Inside IP CIDR. From this CIDR select the first address in this subnet. For example for 169.254.92.80/30 subnet first address is 169.254.92.81. You can use https://www.davidc.net/sites/default/subnets/subnets.html"
  default = ""
}

variable "tunnel2_cgw_inside_ip_address" {
  description = "In AWS Console, click on VPN connections --> Tunnel Details --> Tunnel 2 Inside IP CIDR. From this CIDR select the second address in this subnet. For example for 169.254.92.80/30 subnet second address is 169.254.92.82. You can use https://www.davidc.net/sites/default/subnets/subnets.html"
  default = ""
}

