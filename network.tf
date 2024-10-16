resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.public_subnet_cidrs[0]
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.public_subnet_cidrs[1]
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = var.private_subnet_cidrs[0]
  availability_zone = "${var.region}a"
  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.dev.id
  cidr_block        = var.private_subnet_cidrs[1]
  availability_zone = "${var.region}b"
  tags = {
    Name = "private-subnet-2"
  }
}

# internet gateway
resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "dev-igw"
  }
}

# route table for public subnets
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "public route table"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev-igw.id
}


# route table for private subnets
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "private route table"
  }
}


# associate public subnets with the public route table
resource "aws_route_table_association" "pub-rta1" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id      = aws_subnet.public-subnet-1.id

}

resource "aws_route_table_association" "pub-rta2" {
  route_table_id = aws_route_table.public-rt.id
  subnet_id      = aws_subnet.public-subnet-2.id

}

# associate public subnets with the public route table
resource "aws_route_table_association" "pvt-rta1" {
  route_table_id = aws_route_table.private-rt.id
  subnet_id      = aws_subnet.private-subnet-1.id
}

resource "aws_route_table_association" "pvt-rta2" {
  route_table_id = aws_route_table.private-rt.id
  subnet_id      = aws_subnet.private-subnet-2.id

}