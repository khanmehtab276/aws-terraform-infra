module "dev" {
    source = "./modules/stack"
    env = "dev"
    bucket = "my-s3-bucket"
    key_name = "aws-key"
    sg_name = "sg"
    instance_name = "dev_terraform_instance"
    instance_type = "t3.micro"
    instance_count = 1
}