resource "aws_s3_bucket" "honey_morning_bucket" {
  bucket = "honey-morning-bucket-storage"

  tags = {
    Name = "honey-morning-bucket-storage"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "honey_morning_bucket_block" {
  bucket = aws_s3_bucket.honey_morning_bucket.id
}

resource "aws_s3_bucket_policy" "honey_morning_bucket_policy" {
  bucket = aws_s3_bucket.honey_morning_bucket.id

  policy = jsonencode({
    "Id": "Policy1706194738057",
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt1706192730763",
        "Action": [
          "s3:GetObject"
        ],
        "Effect": "Allow",
        "Principal": "*"
        "Resource": "${aws_s3_bucket.honey_morning_bucket.arn}/*",
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.honey_morning_bucket_block]
}
