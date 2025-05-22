# Azure VM Infrastructure with Terraform

This repository contains Terraform configurations to deploy and manage virtual machines on Microsoft Azure. The infrastructure is designed to be modular, reusable, and follows infrastructure-as-code best practices.

## Project Structure

```
.
├── environments/
│   └── dev/                    # Development environment
│       ├── main.tf            # Main configuration
│       ├── variables.tf       # Variable definitions
│       ├── outputs.tf         # Output definitions
│       └── terraform.tfvars   # Variable values
├── modules/
│   ├── network/               # Network module
│   │   ├── main.tf           # Network resources
│   │   ├── variables.tf      # Network variables
│   │   └── outputs.tf        # Network outputs
│   └── vm/                    # VM module
│       ├── main.tf           # VM resources
│       ├── variables.tf      # VM variables
│       ├── outputs.tf        # VM outputs
│       ├── cloud-init.yml    # Cloud-init for VM1
│       └── cloud-init-vm2.yml # Cloud-init for VM2
└── keypair/                   # SSH key pair directory
    ├── yamhkey               # Private key
    └── yamhkey.pub           # Public key
```

## Features

- **Modular Design**: Separate modules for network and VM resources
- **Multiple Environments**: Support for different environments (dev, prod, etc.)
- **Automated VM Configuration**: Using cloud-init for initial VM setup
- **Security**: SSH key-based authentication
- **Docker Support**: Pre-installed Docker and Docker Compose
- **Database Services**: Optional MongoDB and MySQL containers

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (version >= 1.0.0)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Azure subscription
- SSH key pair

## Getting Started

1. **Azure Authentication**
   ```bash
   az login
   ```

2. **Initialize Terraform**
   ```bash
   cd environments/dev
   terraform init
   ```

3. **Review Changes**
   ```bash
   terraform plan --var-file="terraform.tfvars"
   ```

4. **Apply Changes**
   ```bash
   terraform apply --var-file="terraform.tfvars"
   ```

## VM Configuration

### VM1
- Ubuntu 22.04 LTS
- Pre-installed software:
  - Docker
  - Docker Compose
  - MongoDB
  - MySQL
  - Unzip

### VM2
- Ubuntu 22.04 LTS
- Pre-installed software:
  - Docker
  - Unzip

## SSH Access

To connect to the VMs:
```bash
ssh -i keypair/yamhkey azureuser@<VM_IP>
```

## Variables

Key variables in `terraform.tfvars`:
- `resource_group_name`: Azure resource group name
- `location`: Azure region
- `vm_name`: Name of the first VM
- `vm2_name`: Name of the second VM
- `vm_size`: VM size (e.g., "Standard_B2s")
- `admin_username`: Admin username
- `admin_password`: Admin password

## Outputs

After applying the configuration, Terraform will output:
- VM public IPs
- VM private IPs
- VM names
- Resource group name
- Location

## Security

- SSH key-based authentication
- Network Security Groups (NSG) for traffic control
- Disabled password authentication
- Root login disabled

## Maintenance

### Updating VM Configuration
1. Modify the cloud-init files in the VM module
2. Run `terraform apply` to update the VMs

### Adding New VMs
1. Add new VM configuration in `environments/dev/main.tf`
2. Create corresponding cloud-init file if needed
3. Update variables and outputs

## Cleanup

To destroy the infrastructure:
```bash
terraform destroy --var-file="terraform.tfvars"
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the repository. 