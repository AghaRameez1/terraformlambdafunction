locals {
  PYTHON_VERSION = "python3.8"
  LAMBDA_VERSION = "v2"
}


resource "aws_lambda_function" "testFunction" {
    filename = "${path.module}/code/users.zip"
    function_name ="${var.RESOURCE_PREFIX}-mytestfunction"
    role = "${var.ROLES_ARN}"
    handler = "lambda_function.lambda_handler"
    source_code_hash = data.archive_file.lambda_user_archive.output_base64sha256
    runtime = "${local.PYTHON_VERSION}"
    timeout = 300  
}