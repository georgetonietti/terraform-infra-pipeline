module "s3_prod" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "ec2" {
  source              = "./modules/ec2"
  instance_type       = var.instance_type
  ami_id              = var.ami_id
  security_group_name = var.security_group_name
  docker_image        = var.docker_image
}