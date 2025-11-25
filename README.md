# Cloudera CDP QuickStart with Terraform

This repository provides a Terraform configuration for quickly deploying a complete Cloudera Data Platform (CDP) environment on AWS. It automates the creation of all required AWS infrastructure prerequisites and the CDP environment with a Data Lake.

## Features

- Automated AWS VPC, subnets, and security groups creation
- CDP cross-account IAM roles and policies
- S3 buckets for data, logs, and backups
- CDP environment with FreeIPA for identity management
- CDP Data Lake deployment
- Support for public, semi-private, and private deployment templates
- Ranger Authorization Service (RAZ) support
- CCM tunnel for secure connectivity

## Prerequisites

Before using this Terraform configuration, ensure you have:

1. **Terraform** >= 1.5.7 installed ([Download](https://www.terraform.io/downloads))
2. **AWS CLI** configured with appropriate credentials
3. **CDP CLI** configured with your CDP credentials
4. A **CDP account** with the following:
   - CDP access key and private key
   - Appropriate permissions to create environments and Data Lakes

### CDP Credentials Setup

Set your CDP credentials as environment variables:

```bash
export CDP_ACCESS_KEY_ID="your-cdp-access-key"
export CDP_PRIVATE_KEY="your-cdp-private-key"
```

### AWS Credentials Setup

Set your AWS credentials as environment variables or configure AWS CLI:

```bash
export AWS_ACCESS_KEY_ID="your-aws-access-key"
export AWS_SECRET_ACCESS_KEY="your-aws-secret-key"
export AWS_REGION="us-west-2"
```

Or use AWS CLI configuration:

```bash
aws configure
```

## Quick Start

1. **Clone the repository**

   ```bash
   git clone https://github.com/pyuriy/cdp-ft-quickstart.git
   cd cdp-ft-quickstart
   ```

2. **Configure variables**

   Copy the example variables file and edit it with your values:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your preferred editor
   ```

3. **Initialize Terraform**

   ```bash
   terraform init
   ```

4. **Review the execution plan**

   ```bash
   terraform plan
   ```

5. **Apply the configuration**

   ```bash
   terraform apply
   ```

   Type `yes` when prompted to confirm.

6. **Access your CDP environment**

   After successful deployment, the CDP environment and Data Lake details will be displayed as outputs.

## Configuration Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `env_prefix` | Prefix for naming resources (max 12 chars) | Required |
| `aws_region` | AWS region for deployment | Required |
| `deployment_template` | Deployment pattern: `public`, `semi-private`, or `private` | Required |
| `datalake_scale` | Data Lake scale: `LIGHT_DUTY`, `ENTERPRISE`, or `MEDIUM_DUTY_HA` | `null` |
| `datalake_version` | Data Lake runtime version (`latest` or semantic version) | `latest` |
| `enable_raz` | Enable Ranger Authorization Service | `true` |
| `env_tags` | Tags to apply to all resources | `null` |

## Deployment Templates

- **public**: All resources are publicly accessible. Suitable for development and testing.
- **semi-private**: CDP endpoints are publicly accessible, but data is stored in private subnets.
- **private**: All resources are in private subnets with no direct internet access.

## Outputs

After successful deployment, the following outputs are available:

| Output | Description |
|--------|-------------|
| `cdp_environment_name` | Name of the CDP environment |
| `cdp_environment_crn` | CRN of the CDP environment |
| `cdp_datalake_name` | Name of the Data Lake |
| `cdp_datalake_crn` | CRN of the Data Lake |
| `aws_vpc_id` | ID of the created VPC |
| `aws_public_subnet_ids` | IDs of public subnets |
| `aws_private_subnet_ids` | IDs of private subnets |

## Cleanup

To destroy all resources created by this configuration:

```bash
terraform destroy
```

**Warning**: This will permanently delete all resources including the CDP environment, Data Lake, and all associated AWS infrastructure.

## Troubleshooting

### Common Issues

1. **CDP credential errors**: Ensure your CDP credentials are correctly set as environment variables.

2. **AWS permission errors**: Verify your AWS user/role has sufficient permissions to create VPCs, IAM roles, S3 buckets, etc.

3. **Quota limits**: Check your AWS service quotas if you encounter resource limit errors.

4. **Name conflicts**: Ensure the `env_prefix` is unique to avoid naming conflicts with existing resources.

### Logs

For detailed deployment logs, check:
- Terraform output and state files
- CDP Management Console > Environments > Your Environment > Event History
- AWS CloudWatch Logs

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Resources

- [Cloudera CDP Documentation](https://docs.cloudera.com/cdp-public-cloud/cloud/overview/topics/cdp-public-cloud.html)
- [CDP Terraform Provider](https://registry.terraform.io/providers/cloudera/cdp/latest/docs)
- [AWS Terraform Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Documentation](https://www.terraform.io/docs)
