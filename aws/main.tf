module "compute" {
  source        = "../modules/aws/compute"
  instance_type = var.instance_type
  ami_id        = var.ami_id
}
