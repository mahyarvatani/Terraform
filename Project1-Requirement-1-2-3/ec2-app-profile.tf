resource "aws_iam_instance_profile" "ec2_fullaccess_profile" {
  name = "ec2-fullaccess-profile"
  role = aws_iam_role.ec2_fullaccess_role.name
}
