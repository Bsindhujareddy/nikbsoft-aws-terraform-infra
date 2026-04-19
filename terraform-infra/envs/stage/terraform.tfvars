vpc_cidr = "10.1.0.0/16"
vpc_name = "stage-vpc"

public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.3.0/24", "10.1.4.0/24"]

availability_zones = ["ap-south-1a", "ap-south-1b"]

igw_name = "stage-igw"
nat_name = "stage-nat"