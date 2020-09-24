resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "main"
    Location = "London"
  }


}
resource "aws_subnet" "subnet1" {

  vpc_id                  = aws_vpc.main.id
  cidr_block  = "10.0.1.0/24" 
  tags = { Name = "subnet1"}
  availability_zone       = "eu-west-1a"
}

# Create the Internet Gateway
resource "aws_internet_gateway" "My_VPC_GW" {
 vpc_id = aws_vpc.main.id
 tags = {
        Name = "My VPC Internet Gateway"
}
} # end resource

#
#esource "aws_internet_gateway" "default" {
# vpc_id = "aws_vpc.main.id"
#
