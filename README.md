# GitHub Actions Examples

This repository contains GitHub Actions workflows for various tasks including system commands and EC2 instance provisioning.

## Workflows

### 1. System Commands
- **Simple Commands**: Runs basic system information commands
- **No Dependencies**: No external tools or packages required
- **Quick Execution**: Fast and lightweight
- **System Information**: Displays date, hostname, and system details

### 2. EC2 Instance Provisioning
- **Terraform-based**: Uses Infrastructure as Code for provisioning
- **Customizable**: Configurable instance types, regions, and specifications
- **Secure**: Creates security groups with proper access controls
- **Automated**: One-click deployment with workflow_dispatch inputs

## Quick Start

### System Commands Workflow

1. Go to your repository on GitHub
2. Click on "Actions" tab
3. Select "Run System Commands" workflow
4. Click "Run workflow"
5. The workflow will execute the commands and show the output

### EC2 Provisioning Workflow

#### Prerequisites:
1. **AWS Credentials**: Set up these GitHub secrets:
   - `AWS_ACCESS_KEY_ID` - Your AWS access key
   - `AWS_SECRET_ACCESS_KEY` - Your AWS secret key
   - `AWS_KEY_NAME` - Name of your EC2 key pair
   - `AWS_SUBNET_ID` - Subnet ID where to launch the instance

#### Deploy EC2 Instance:
1. Go to your repository on GitHub
2. Click on "Actions" tab
3. Select "Provision EC2 Instance" workflow
4. Click "Run workflow"
5. Fill in the VM specifications:
   - Instance Type (t3.micro, t3.small, etc.)
   - Instance Name
   - AWS Region
   - Volume Size
   - Environment (dev/staging/prod)
   - Project Name
6. Click "Run workflow" to deploy

## System Commands

The system commands workflow runs these commands:

```bash
# Date and time
date

# Hostname
hostname

# System information
uname -a

# Current directory
pwd

# Directory contents
ls -la
```

## EC2 Instance Configuration

The Terraform configuration creates:

- **EC2 Instance**: Amazon Linux 2 with specified instance type
- **Security Group**: Allows SSH (22), HTTP (80), and HTTPS (443)
- **Root Volume**: GP3 encrypted volume with specified size
- **User Data**: Installs and starts Apache web server
- **Tags**: Environment, project, and creation metadata

## Output Examples

### System Commands Output

When you run the system commands workflow, you'll see output like:

```
=== System Information ===
Date and Time:
Mon Dec 18 10:30:45 UTC 2023

Hostname:
fv-az1234-567

System Information:
Linux fv-az1234-567 5.15.0-1047-azure #52~20.04.1-Ubuntu SMP Thu Oct 12 18:48:47 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux

Current Directory:
/home/runner/work/your-repo/your-repo

Directory Contents:
total 12
drwxr-xr-x 3 runner docker 4096 Dec 18 10:30 .
drwxr-xr-x 3 runner docker 4096 Dec 18 10:30 ..
drwxr-xr-x 8 runner docker 4096 Dec 18 10:30 .git
-rw-r--r-- 1 runner docker  123 Dec 18 10:30 README.md
```

### EC2 Provisioning Output

When you run the EC2 provisioning workflow, you'll see output like:

```
=== EC2 Instance Created Successfully ===
Instance ID: i-1234567890abcdef0
Public IP: 52.23.45.67
Private IP: 10.0.1.100
Instance Type: t3.micro
Region: us-east-1
Environment: dev

You can SSH to the instance using:
ssh -i your-key.pem ec2-user@52.23.45.67

Or access the web server at:
http://52.23.45.67
```

## Use Cases

### System Commands:
- **Testing**: Verify GitHub Actions runner environment
- **Debugging**: Check system information during workflow execution
- **Learning**: Understand what commands are available on the runner
- **Documentation**: Generate system information for documentation

### EC2 Provisioning:
- **Development**: Quick deployment of development environments
- **Testing**: Provision test instances for application testing
- **Staging**: Deploy staging environments for pre-production testing
- **Demo**: Create demo instances for presentations or demonstrations

## Requirements

### System Commands:
- No special requirements
- Runs on any GitHub Actions runner
- No secrets or configuration needed

### EC2 Provisioning:
- AWS account with appropriate permissions
- EC2 key pair for SSH access
- VPC with at least one subnet
- GitHub secrets configured for AWS credentials

## License

This project is open source and available under the MIT License.