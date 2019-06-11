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




Usage
-----
```
module "ecs-service" {
  source = "git::https://github.com/egarbi/terraform-aws-ecs-service"

  name                  = "example"
  environment           = "testing"
  desired_count         = "1"
  cluster               = "example-cluster"
  vpc_id                = "vpc-XXXXXXX"
  zone_id               = "Z4KAPRWWNC7JR"
  iam_role              = "arn:aws:iam::12345678910:role/ec2_role"
  rule_priority         = "10"
  alb_listener          = "arn:aws:elasticloadbalancing:eu-west-1:12345678910:listener/app/example/1e590za2072344a6nc01fh545fb2301d1"
  alb_zone_id           = "Z4KAPRXXXC7JR"
  alb_dns_name          = "example"
  container_definitions = "${file("container_definitions.json")}"
}
```

The referenced `container_definitions.json` file contains a valid JSON document, which is shown below, and its content is going to be passed directly into the container_definitions attribute as a string. Please note that this example contains only a small subset of the available parameters.
```
[
  {
    "name": "first",
    "image": "service-first",
    "cpu": 10,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  },
  {
    "name": "second",
    "image": "service-second",
    "cpu": 10,
    "memory": 256,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 443,
        "hostPort": 443
      }
    ]
  }
]

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alb\_dns\_name | DNS name of the ALB where the rule will be added | string | n/a | yes |
| alb\_listener | Listener where the rule will be added | string | n/a | yes |
| alb\_zone\_id | Zone ID where the ALB is hosted | string | n/a | yes |
| cluster | The cluster name | string | n/a | yes |
| container\_definitions | here you should include the full container definitions | string | n/a | yes |
| container\_port | The container port | string | `"8080"` | no |
| cookie\_duration | The time period, in seconds, during which requests from a client should be routed to the same target.The range is 1 second to 1 week (604800 seconds) | string | `"86400"` | no |
| desired\_count | The desired count | string | `"1"` | no |
| environment | Environment tag, e.g prod | string | `"default"` | no |
| healthcheck |  | map | `<map>` | no |
| iam\_role | IAM Role ARN to use | string | n/a | yes |
| name | The service name | string | n/a | yes |
| policy | IAM custom policy to be attached to the task role | string | `""` | no |
| rule\_priority | This is the priority number of the listener's rule | string | n/a | yes |
| stick\_enabled | Boolen to enable / disable stickiness | string | `"false"` | no |
| vpc\_id | The VPC ID were the ECS is running | string | n/a | yes |
| zone\_id | Zone ID where the ECS service (record) will be added | string | n/a | yes |



