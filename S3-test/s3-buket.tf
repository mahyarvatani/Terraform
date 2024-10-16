
resource "aws_s3_bucket" "s3_bucket_1" {
  bucket_prefix = local.name
  force_destroy = true




  tags = {
    Name = "bucket_1"
  }
}

resource "aws_s3_bucket_accelerate_configuration" "s3_bucket1_acc" {
  bucket = aws_s3_bucket.s3_bucket_1.id
  status = "Enabled"
}

# resource "aws_s3_bucket_acl" "s3_bucket1_acl" {
#   bucket = aws_s3_bucket.s3_bucket_1.id
#   acl    = "private"
# }

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.s3_bucket_1.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket1_ownership_control" {
  bucket = aws_s3_bucket.s3_bucket_1.id

  rule {
    object_ownership = "ObjectWriter"
  }
}


resource "aws_s3_bucket_policy" "allow_access_for_public" {
  bucket = aws_s3_bucket.s3_bucket_1.id
  policy = "${data.aws_iam_policy_document.allow_access_for_public.json}"
}

data "aws_iam_policy_document" "allow_access_for_public" {
  statement {
    # principals {
    #   type        = "AWS"
    #   identifiers = ["*"]
    # }

    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]
    effect = "Allow"
    resources = [
      aws_s3_bucket.s3_bucket_1.arn,
      "${aws_s3_bucket.s3_bucket_1.arn}/*",
    ]
  }
}


resource "aws_s3_bucket_website_configuration" "s3_website-config" {
  bucket = aws_s3_bucket.s3_bucket_1.id
index_document {
    suffix = "index.html"
  }
error_document {
    key = "404.jpeg"
  }
# routing_rule {
#     condition {
#       key_prefix_equals = "/abc"
#     }
#     redirect {
#       replace_key_prefix_with = "comming-soon.jpeg"
#     }
#   }
}