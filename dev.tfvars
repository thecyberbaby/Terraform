profile              = "Lab_Account"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.2.0/24", "10.0.4.0/24"]
bastion_ami          = ""
instance_type        = "t2.large"
key_name             = "key_pair"