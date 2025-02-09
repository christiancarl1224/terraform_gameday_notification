# SNS Topic
resource "aws_sns_topic" "nba_game_alerts" {
  name = "nba_game_alerts"
}

#SNS Topic Subscription
resource "aws_sns_topic_subscription" "sns_email_subscription" {
  topic_arn = aws_sns_topic.nba_game_alerts.arn
  protocol  = "email"
  endpoint  = "<EMAIL_ADDRESS>"
}