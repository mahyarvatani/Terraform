resource "aws_iam_user" "admin1" {
  name = "admin1"
  path = "/"

  tags = {
    tag-key = "admin-user"
  }
}

resource "aws_iam_access_key" "admin1_access_key" {
  user = aws_iam_user.admin1.name
}


resource "aws_iam_user" "dev1" {
  name = "dev1"
  path = "/"

  tags = {
    tag-key = "dev-user"
  }
}

resource "aws_iam_access_key" "dev1_access_key" {
  user = aws_iam_user.dev1.name
}