## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_id | AMI that will be launched | string | `"ami-06832d84cd1dbb448"` | no |
| arn | alb arn | string | `"arn:aws:elasticloadbalancing:ap-south-1:521141440450:listener/app/terraform-ec2/4da163a5881680a9/b509f31de06392f3"` | no |
| ec2\_subnet\_id | Subnet(s) to which the EC2 instance will be deployed | string | `"subnet-25890c69"` | no |
| instance\_type | EC2 instance type | string | `"t2.micro"` | no |
| key\_name |  | string | `"bhavya1.pem"` | no |
| name | Unique name of your Terraform environment to be used for naming and tagging resources | string | `"test"` | no |
| port | Port of the EC2 instance to which the ALB will forward | string | `"8080"` | no |
| protocol | Protocol running on the port to which the ALB will forward | string | `"HTTP"` | no |
| tags | Additional tags to be applied to all resources | map | `<map>` | no |
| value |  | string | `"aspire.tothenew.net"` | no |
| volume\_size | size of the volume attached with ec2 | string | `"50"` | no |
| vpc\_id | Id of the VPC to which your AMI will be deployed | string | `"vpc-958fa0fd"` | no |

