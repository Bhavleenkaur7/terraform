## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| arn |  | string | `"arn:aws:elasticloadbalancing:ap-south-1:521141440450:listener/app/terraform-ec2/4da163a5881680a9/b509f31de06392f3"` | no |
| instance\_id |  | string | n/a | yes |
| name | Unique name of your Terraform environment to be used for naming and tagging resources | string | `"test"` | no |
| port | Port of the EC2 instance to which the ALB will forward | string | `"8080"` | no |
| protocol | Protocol running on the port to which the ALB will forward | string | `"HTTP"` | no |
| tags |  | string | n/a | yes |
| value |  | string | `"aspire.tothenew.net"` | no |
| vpc\_id | Id of the VPC to which your AMI will be deployed | string | `"vpc-958fa0fd"` | no |

## Outputs

| Name | Description |
|------|-------------|
| alb\_arn |  |


