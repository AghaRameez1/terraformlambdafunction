variable "iam_policy_arn" {
    description = "IAM policy to be attached"
    type = list
    default = [
       "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
       "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole",
       "arn:aws:iam::aws:policy/service-role/AWSLambdaDynamoDBExecutionRole",
       "arn:aws:iam::aws:policy/AWSLambdaExecute",
       "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole" 
    ]
  
}

variable "cloudwatch_event_rule_pattern_json" {
    default = {
    "source": ["aws.codecommit"],
    "detail-type": ["CodeCommit Repository State Change"],
    "resources": ["arn:aws:codecommit:eu-central-1:489994096722:ApprokoWebapp"],
    "detail": {
      "event": ["referenceCreated", "referenceUpdated"],
      "referenceType": ["branch"],
      "referenceName": ["master"]
    }
  }
  
}