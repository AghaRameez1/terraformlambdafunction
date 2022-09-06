data "archive_file" "lambda_user_archive"{
    type = "zip"
    source_dir = "${path.module}/code/users"
    output_path = "${path.module}/code/users.zip"
}