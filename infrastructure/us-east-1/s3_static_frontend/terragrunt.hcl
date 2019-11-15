terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-s3-bucket?ref=v1.0.0"
}
include {
  path = find_in_parent_folders()
}

inputs = {

  bucket        = "s3-bucket-acme-website-static-frontend"
  acl           = "private"
  force_destroy = true

  versioning = {
    enabled = true
  }

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }

}




