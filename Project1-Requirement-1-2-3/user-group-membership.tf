
resource "aws_iam_user_group_membership" "administrators_membership" {
  user = aws_iam_user.admin1.name

  groups = [
    aws_iam_group.administrators.name
  ]
}


resource "aws_iam_user_group_membership" "developers_membership" {
  user = aws_iam_user.dev1.name

  groups = [
    aws_iam_group.developers.name
  ]
}

