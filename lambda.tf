# Lambda Function
resource "aws_lambda_function" "nba_lambda" {
  filename      = "nba_notifications.zip" # Pre-packaged ZIP
  function_name = "nba_game_alerts"
  role          = aws_iam_role.lambda_role.arn
  handler       = "nba_notifications.lambda_handler"
  runtime       = "python3.8"

  environment {
    variables = {
      SNS_TOPIC_ARN = aws_sns_topic.nba_game_alerts.arn
    }
  }
}