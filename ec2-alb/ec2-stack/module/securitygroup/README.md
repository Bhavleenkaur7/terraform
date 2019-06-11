## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Unique name of your Terraform environment to be used for naming and tagging resources | string | n/a | yes |
| port |  | string | n/a | yes |
| tags | Additional tags to be applied to all resources | map | `<map>` | no |
| vpc\_id | Id of the VPC to which your AMI will be deployed | string | `"vpc-958fa0fd"` | no |

## Outputs

| Name | Description |
|------|-------------|
| sg\_id\_ec2 |  |

