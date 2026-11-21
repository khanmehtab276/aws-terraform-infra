resource "aws_s3_bucket" "my_bucket" {
    bucket = "${var.env}-${var.bucket}"
    tags = {
        Name = var.bucket
        Environment = var.env
    }
}