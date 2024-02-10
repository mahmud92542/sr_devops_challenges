resource "aws_cloudwatch_event_rule" "sgp-uat-cw-rule-start-ec2" {
    name = "sgp-uat-cw-rule-start-ec2"
    description = "Trigger Lambda function to start EC2, RDS instances"
    schedule_expression = "cron(0 8 ? * MON-FRI *)"
}


resource "aws_cloudwatch_event_rule" "sgp-uat-cw-rule-stop-ec2" {
    name = "sgp-uat-cw-rule-stop-ec2"
    description = "Trigger Lambda function to stop EC2, RDS instances"
    schedule_expression = "cron(0 20 ? * MON-FRI *)"
}


resource "aws_cloudwatch_event_target" "sgp-uat-lbd-start-ec2" {
    arn = aws_lambda_function.sgp-uat-lbd-start-stop-ec2.arn
    rule = aws_cloudwatch_event_rule.sgp-uat-cw-rule-start-ec2.name
    input = <<JSON
    {
    "operations": [
        {
            "instance_type": "ec2",
            "operation": "start"
        },
        {
            "instance_type": "rds",
            "operation": "start"
        }
    ]
}

JSON
}

resource "aws_cloudwatch_event_target" "sgp-uat-lbd-stop-ec2" {
    arn = aws_lambda_function.sgp-uat-lbd-start-stop-ec2.arn
    rule = aws_cloudwatch_event_rule.sgp-uat-cw-rule-stop-ec2.name
    input = <<JSON
    {
    "operations": [
        {
            "instance_type": "ec2",
            "operation": "stop"
        },
        {
            "instance_type": "rds",
            "operation": "stop"
        }
    ]
}

JSON
}

resource "aws_lambda_permission" "start-permission" {
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.sgp-uat-lbd-start-stop-ec2.arn
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.sgp-uat-cw-rule-start-ec2.arn
}

resource "aws_lambda_permission" "stop-permission" {
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.sgp-uat-lbd-start-stop-ec2.arn
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.sgp-uat-cw-rule-stop-ec2.arn
}