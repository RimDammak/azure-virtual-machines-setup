
---

# Terraform Azure Virtual Machines Deployment

🚀 **Deploy Azure Virtual Machines with Terraform**

This Terraform project automates the deployment of Azure resources including a Virtual Network, Subnet, Network Security Group, and Linux Virtual Machines.

## Prerequisites

Before you begin, ensure you have the following installed and set up:

1. **Terraform**: Install Terraform by following the [official installation guide](https://learn.hashicorp.com/tutorials/terraform/install-cli).
   
2. **Azure CLI**: Configure Azure CLI and authenticate by running `az login`. Make sure your account has the necessary permissions to create Azure resources.

3. **SSH Key Pair**: Generate an SSH key pair if you haven't already. You will need the public key (`id_rsa.pub`) for SSH access to the virtual machines.

## Getting Started

1. **Clone the Repository**:

   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. **Initialize Terraform**:

   ```bash
   terraform init
   ```

3. **Set Terraform Variables**:

   Copy the `terraform.tfvars.example` file to `terraform.tfvars` and adjust the variables as per your environment:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

   Modify `terraform.tfvars` to set your `prefix`, `location`, `nodecount`, `username`, `password`, and any other required variables.

4. **Review Terraform Plan**:

   ```bash
   terraform plan
   ```

   This command shows you what Terraform will do when you apply your configuration.

5. **Apply Terraform Configuration**:

   ```bash
   terraform apply
   ```

   Review the plan and type `yes` to apply the configuration and provision Azure resources.

6. **Accessing Virtual Machines**:

   Once deployed, Terraform will output information about the deployed resources, including public IP addresses of the virtual machines. Use SSH to connect:

   ```bash
   ssh <username>@<public-ip-address>
   ```

   Replace `<username>` with your specified admin username and `<public-ip-address>` with the actual IP.

## Cleanup

To avoid unnecessary charges, destroy the Terraform-managed infrastructure when no longer needed:

```bash
terraform destroy
```

Type `yes` to confirm destruction.

## Contributions are welcome! <3 <3 

- **Ansible**: This configuration installs Ansible on the deployed virtual machines using remote-exec provisioner. Ensure your local machine has Ansible installed if you plan to manage these VMs using Ansible scripts.

- **Customization**: Feel free to modify variables or add more resources in `main.tf` as per your project requirements.

---

Feel free to customize this README further based on your specific needs or add more sections as required. Happy deploying! 🌟
