module "ec2" {
  source        = "../compute"
  key_name      = var.key_name
  sg_name       = var.sg_name
  instance_name = var.instance_name
  instance_type = var.instance_type
  instance_count         = var.instance_count
  env = var.env
}

module "s3" {
  source = "../storage"
  bucket = var.bucket
  env    = var.env
}

module "dynamodb" {
  source = "../database"

}
