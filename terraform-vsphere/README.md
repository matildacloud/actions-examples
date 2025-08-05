# vSphere VM Provisioning with Terraform

This directory contains Terraform configurations for provisioning virtual machines in vSphere using GitHub Actions.

## Features

- **VM Cloning**: Creates VMs from existing templates
- **Network Configuration**: Configures static IP addresses
- **Resource Management**: Configurable CPU, memory, and disk sizes
- **Tagging**: Automatic tagging for environment and project management
- **Security**: Supports SSL certificate verification options

## Prerequisites

### vSphere Environment
- vSphere server (6.5 or later)
- Datacenter with compute cluster
- Datastore for VM storage
- Network configuration
- VM template (Linux recommended)
- Resource pool (optional)
- VM folder (optional)

### GitHub Secrets
Set up these secrets in your GitHub repository:

#### Required Secrets:
- `VSPHERE_SERVER` - vSphere server address (e.g., vcenter.company.com)
- `VSPHERE_USER` - vSphere username
- `VSPHERE_PASSWORD` - vSphere password
- `VSPHERE_DATACENTER` - Name of the datacenter
- `VSPHERE_CLUSTER` - Name of the compute cluster
- `VSPHERE_DATASTORE` - Name of the datastore
- `VSPHERE_NETWORK` - Name of the network
- `VSPHERE_TEMPLATE` - Name of the VM template

#### Optional Secrets:
- `VSPHERE_RESOURCE_POOL` - Name of the resource pool
- `VSPHERE_VM_FOLDER` - Name of the VM folder
- `VSPHERE_ALLOW_UNVERIFIED_SSL` - Set to 'true' for self-signed certificates

## Usage

### 1. Deploy VM
1. Go to your repository on GitHub
2. Navigate to Actions → "Provision vSphere VM"
3. Click "Run workflow"
4. Fill in the VM specifications:
   - **VM Name**: Name for the virtual machine
   - **Instance Type**: Size category (small, medium, large, xlarge)
   - **Number of CPUs**: CPU cores to allocate
   - **Memory in MB**: Memory to allocate
   - **Disk Size in GB**: Primary disk size
   - **IPv4 Address**: Static IP address for the VM
   - **IPv4 Gateway**: Network gateway address
   - **Environment**: dev, staging, or prod
   - **Project Name**: Project identifier

### 2. Destroy VM
1. Go to Actions → "Destroy vSphere VM"
2. Click "Run workflow"
3. Enter the VM name to destroy
4. Confirm the destruction

## Configuration Details

### VM Specifications
- **Small**: 2 CPU, 4GB RAM, 50GB disk
- **Medium**: 4 CPU, 8GB RAM, 100GB disk
- **Large**: 8 CPU, 16GB RAM, 200GB disk
- **XLarge**: 16 CPU, 32GB RAM, 500GB disk

### Network Configuration
- Static IP addressing
- Configurable subnet mask (default: /24)
- Gateway configuration
- Domain name support

### Storage
- Thin-provisioned disks
- Configurable disk sizes
- Datastore selection

### Security
- SSL certificate verification (configurable)
- Secure credential handling via GitHub secrets
- Network isolation through vSphere networking

## File Structure

```
terraform-vsphere/
├── main.tf          # Main Terraform configuration
├── variables.tf     # Variable definitions
├── outputs.tf       # Output definitions
└── README.md        # This documentation
```

## Example Output

When you run the workflow, you'll see output like:

```
=== vSphere VM Created Successfully ===
VM ID: vm-12345
VM Name: github-actions-vm
VM IP Address: 192.168.1.100
Power State: poweredOn
Instance Type: small
CPUs: 2
Memory: 4096 MB
Disk Size: 50 GB
Environment: dev

You can SSH to the VM using:
ssh username@192.168.1.100

VM is accessible at:
http://192.168.1.100
```

## Troubleshooting

### Common Issues:

1. **Authentication Failed**
   - Verify vSphere credentials in GitHub secrets
   - Check user permissions in vSphere

2. **Template Not Found**
   - Ensure the template name exists in the specified datacenter
   - Verify template is accessible to the user

3. **Network Issues**
   - Confirm network name exists in the datacenter
   - Check IP address availability

4. **Resource Constraints**
   - Verify sufficient resources in the cluster
   - Check datastore capacity

5. **SSL Certificate Issues**
   - Set `VSPHERE_ALLOW_UNVERIFIED_SSL=true` for self-signed certificates
   - Ensure proper certificate configuration

### Debug Steps:

1. Check vSphere logs for detailed error messages
2. Verify all required secrets are set in GitHub
3. Test vSphere connectivity manually
4. Review Terraform plan output for configuration issues

## Security Considerations

- Store vSphere credentials as GitHub secrets
- Use dedicated service accounts with minimal required permissions
- Enable SSL certificate verification in production
- Regularly rotate vSphere passwords
- Use network segmentation for different environments

## Support

For issues or questions:
1. Check the troubleshooting section above
2. Review vSphere and Terraform documentation
3. Verify GitHub Actions logs for detailed error messages 