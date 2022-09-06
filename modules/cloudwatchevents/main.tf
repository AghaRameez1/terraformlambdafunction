resource "aws_cloudwatch_event_rule" "event_rule" {
  name = "${var.RESOURCE_PREFIX}-rule"
  description = "${var.DESCRIPTION}"
  event_pattern = "${var.EVENT_PATTERN}"
  
}
resource "aws_cloudwatch_event_target" "event_target" {
  target_id = "test-target"
  rule = aws_cloudwatch_event_rule.event_rule.name
  arn ="${var.PIPELINE_ARN}"
  role_arn = "${var.ROLE_ARN}"
  
}