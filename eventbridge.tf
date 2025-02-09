# EventBridge Rule for Scheduling
resource "aws_cloudwatch_event_rule" "nba_schedule" {
  name                = "nba_game_alerts_schedule"
  schedule_expression = "rate(2 hours)" # Adjust as needed
}

# EventBridge Target
resource "aws_cloudwatch_event_target" "nba_target" {
  rule      = aws_cloudwatch_event_rule.nba_schedule.name
  target_id = "nba_lambda"
  arn       = aws_lambda_function.nba_lambda.arn
}

# Grant EventBridge Permission to Invoke Lambda
resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.nba_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.nba_schedule.arn
}