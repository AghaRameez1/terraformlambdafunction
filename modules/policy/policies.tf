resource "aws_iam_policy" "allpolicy" {
  name = "${var.RESOURCE_PREFIX}-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "Stmt1659334430865",
        "Action" : "*",
        "Effect" : "Allow",
        "Resource" : "*"
      }
  ] })
}
resource "aws_iam_role_policy_attachment" "test_attachment" {

  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
    "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaDynamoDBExecutionRole",
    "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
    "arn:aws:iam::489994096722:policy/${aws_iam_policy.allpolicy.name}"
  ])
  role       = var.ROLE_NAME
  policy_arn = each.value
}
