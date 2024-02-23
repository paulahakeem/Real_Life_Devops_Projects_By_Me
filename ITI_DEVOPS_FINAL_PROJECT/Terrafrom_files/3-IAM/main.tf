resource "aws_iam_role" "iam-role" {
  name = var.role_name

  assume_role_policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "${var.service_name}.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
  POLICY
}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {
  for_each   = toset(var.policies_arns)
  policy_arn = each.value
  role       = aws_iam_role.iam-role.name
}