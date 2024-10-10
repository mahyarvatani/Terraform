resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}

resource "aws_iam_group" "administrators" {
  name = "administrators"
  path = "/"
}