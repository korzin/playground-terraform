provider aws {
  region  = "us-east-1"
  # to get aws private/public keys
  profile = "tfplayground-own"
}

resource aws_s3_bucket terraform_state_s3_bucket {
  bucket = "terraform-state-play-ground"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Project: "tf-playground-state"
  }
}

resource aws_s3_bucket_policy terraform_state_s3_bucket_policy {
  bucket = aws_s3_bucket.terraform_state_s3_bucket.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "RequireEncryption",
   "Statement": [
    {
      "Sid": "RequireEncryptedTransport",
      "Effect": "Deny",
      "Action": ["s3:*"],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.terraform_state_s3_bucket.bucket}/*"],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      },
      "Principal": "*"
    },
    {
      "Sid": "RequireEncryptedStorage",
      "Effect": "Deny",
      "Action": ["s3:PutObject"],
      "Resource": ["arn:aws:s3:::${aws_s3_bucket.terraform_state_s3_bucket.bucket}/*"],
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "AES256"
        }
      },
      "Principal": "*"
    }
  ]
}
EOF
}

resource aws_dynamodb_table terraform_state_lock_dynamodb_table {
  name           = "terraform-state-play-ground-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "tf-playground-stage-lock"
    Project: "tf-playground-state"
  }
}