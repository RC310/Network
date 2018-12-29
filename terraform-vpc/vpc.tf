resource "aws_vpc" "RP-VPC" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "RP-vpc"
    }
}

resource "aws_internet_gateway" "RP-IGW" {
    vpc_id = "${aws_vpc.RP-VPC.id}"
}

/*
  NAT Instance
*/

resource "aws_eip" "RP-nat" {
    instance = "${aws_instance.RP-nat.id}"
    vpc = true
}

/*
  Public Subnet
*/
resource "aws_subnet" "RP-Public" {
    vpc_id = "${aws_vpc.RP-VPC.id}"

    cidr_block = "${var.RP-public_subnet}"
    availability_zone = "us-west-2a"

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table" "RT-public" {
    vpc_id = "${aws_vpc.RP-VPC.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.RP-VPC.id}"
    }

    tags {
        Name = "Public Subnet"
    }
}

resource "aws_route_table_association" "RT-public-ass" {
    subnet_id = "${aws_subnet.RP-public.id}"
    route_table_id = "${aws_route_table.RT-public.id}"
}

/*
  Private Subnet
*/
resource "aws_subnet" "RP-private" {
    vpc_id = "${aws_vpc.RP-VPC.id}"

    cidr_block = "${var.RP-private_subnet}"
    availability_zone = "us-west-2b"

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table" "RT-private" {
    vpc_id = "${aws_vpc.RP-VPC.id}"

    route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.RP-nat.id}"
    }

    tags {
        Name = "Private Subnet"
    }
}

resource "aws_route_table_association" "RT-private-ass" {
    subnet_id = "${aws_subnet.RP-private.id}"
    route_table_id = "${aws_route_table.RT-private.id}"
}
