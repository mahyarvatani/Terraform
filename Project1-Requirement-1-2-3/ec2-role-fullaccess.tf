resource "aws_iam_role" "ec2_fullaccess_role" {
  name = "ec2-fullaccess-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role_policy_attachment" "ec2_fullaccess_policy" {
  role       = aws_iam_role.ec2_fullaccess_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}