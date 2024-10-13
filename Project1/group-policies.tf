
resource "aws_iam_policy" "admin_policy" {
  name = "admin-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "*",
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "admingroup-attach" {
  group      = aws_iam_group.administrators.name
  policy_arn = aws_iam_policy.admin_policy.arn
}

resource "aws_iam_policy" "developers_policy" {
  name = "developer-policy"
  policy = jsonencode({
    "Statement" : [
      {
        "Sid" : "AWSServicesAccess",
        "Action" : [
          "codebuild:StartBuild",
          "codebuild:StopBuild",
          "codebuild:StartBuildBatch",
          "codebuild:StopBuildBatch",
          "codebuild:RetryBuild",
          "codebuild:RetryBuildBatch",
          "codebuild:BatchGet*",
          "codebuild:GetResourcePolicy",
          "codebuild:DescribeTestCases",
          "codebuild:DescribeCodeCoverages",
          "codebuild:List*",
          "codecommit:GetBranch",
          "codecommit:GetCommit",
          "codecommit:GetRepository",
          "codecommit:ListBranches",
          "cloudwatch:GetMetricStatistics",
          "events:DescribeRule",
          "events:ListTargetsByRule",
          "events:ListRuleNamesByTarget",
          "logs:GetLogEvents",
          "s3:GetBucketLocation",
          "s3:ListAllMyBuckets"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      },
      {
        "Sid" : "SSMParameterWriteAccess",
        "Effect" : "Allow",
        "Action" : [
          "ssm:PutParameter"
        ],
        "Resource" : "arn:aws:ssm:*:*:parameter/CodeBuild/*"
      },
      {
        "Sid" : "SSMStartSessionAccess",
        "Effect" : "Allow",
        "Action" : [
          "ssm:StartSession"
        ],
        "Resource" : "arn:aws:ecs:*:*:task/*/*"
      },
      {
        "Sid" : "CodeStarConnectionsUserAccess",
        "Effect" : "Allow",
        "Action" : [
          "codestar-connections:ListConnections",
          "codestar-connections:GetConnection"
        ],
        "Resource" : [
          "arn:aws:codestar-connections:*:*:connection/*",
          "arn:aws:codeconnections:*:*:connection/*"
        ]
      },
      {
        "Sid" : "CodeStarNotificationsReadWriteAccess",
        "Effect" : "Allow",
        "Action" : [
          "codestar-notifications:CreateNotificationRule",
          "codestar-notifications:DescribeNotificationRule",
          "codestar-notifications:UpdateNotificationRule",
          "codestar-notifications:Subscribe",
          "codestar-notifications:Unsubscribe"
        ],
        "Resource" : "*",
        "Condition" : {
          "StringLike" : {
            "codestar-notifications:NotificationsForResource" : "arn:aws:codebuild:*"
          }
        }
      },
      {
        "Sid" : "CodeStarNotificationsListAccess",
        "Effect" : "Allow",
        "Action" : [
          "codestar-notifications:ListNotificationRules",
          "codestar-notifications:ListEventTypes",
          "codestar-notifications:ListTargets",
          "codestar-notifications:ListTagsforResource"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "SNSTopicListAccess",
        "Effect" : "Allow",
        "Action" : [
          "sns:ListTopics",
          "sns:GetTopicAttributes"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "CodeStarNotificationsChatbotAccess",
        "Effect" : "Allow",
        "Action" : [
          "chatbot:DescribeSlackChannelConfigurations",
          "chatbot:ListMicrosoftTeamsChannelConfigurations"
        ],
        "Resource" : "*"
      }
    ],
    "Version" : "2012-10-17"
  })
}

resource "aws_iam_group_policy_attachment" "developergroup-attach" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.developers_policy.arn
}
