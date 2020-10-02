resource "aws_default_vpc" "shunkakinoki" {
  tags = {
    Name = "shunkakinoki"
  }
}

resource "aws_internet_gateway" "shunkakinoki" {
  vpc_id = aws_default_vpc.shunkakinoki.id
  tags = {
    Name = "shunkakinoki"
  }
}

resource "aws_default_vpc_dhcp_options" "shunkakinoki" {
  tags = {
    Name = "shunkakinoki"
  }
}

resource "aws_default_route_table" "shunkakinoki" {
  default_route_table_id = aws_default_vpc.shunkakinoki.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.shunkakinoki.id
  }
  tags = {
    Name = "shunkakinoki"
  }
}

resource "aws_default_security_group" "shunkakinoki" {
  vpc_id = aws_default_vpc.shunkakinoki.id
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = []
    self            = true
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "shunkakinoki"
  }
}

data "aws_subnet_ids" "shunkakinoki" {
  vpc_id = aws_default_vpc.shunkakinoki.id
}

resource "aws_default_network_acl" "shunkakinoki" {
  default_network_acl_id = aws_default_vpc.shunkakinoki.default_network_acl_id
  subnet_ids             = data.aws_subnet_ids.shunkakinoki.ids
  ingress {
    from_port  = 0
    to_port    = 0
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }
  egress {
    from_port  = 0
    to_port    = 0
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "shunkakinoki"
  }
}

resource "aws_default_subnet" "shunkakinoki" {
  count             = length(var.azs)
  availability_zone = var.azs[count.index]
  tags = {
    Name = "shunkakinoki"
  }
}
