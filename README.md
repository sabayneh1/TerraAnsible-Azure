# **Terraform and Ansible Configuration for Cloud Infrastructure**

## **Project Overview**

This project automates the deployment of a robust cloud infrastructure on Azure using Terraform and configures the deployed resources with Ansible. It sets up a resource group, networking components, Linux and Windows virtual machines, data disks, and a load balancer in the Canada East region. Additionally, it leverages Ansible for application deployment and configuration management across the infrastructure.

## **Prerequisites**

- Azure CLI
- Terraform
- Ansible
- Python 2.7
- pip (Python package installer)

## **Terraform Modules**

- **Resource Group**: Creates a resource group named **`6507-assignment2-RG`** in Canada East.
- **Network**: Configures a virtual network (**`vnet-prd`**) with a subnet (**`subnet-prd2`**) and a network security group (**`nsg-prd2`**).
- **Common**: A module for shared resources and configurations.
- **Linux**: Deploys Linux virtual machines within the configured network.
- **Windows**: Deploys Windows virtual machines within the same network.
- **DataDisk**: Attaches additional data disks to the virtual machines.
- **LoadBalancer**: Sets up a load balancer to distribute traffic to the virtual machines.
- **Database**: Optionally configures a database in the East US region.

## **Ansible Configuration**

Ansible is used for configuring the deployed virtual machines, installing necessary software, and ensuring the servers are ready for application deployment.

### **Setup and Configuration**

1. **Installing Dependencies**:

    Install Ansible and its dependencies:

    ```bash
    pip install ansible
    ```

2. **Ansible Playbook Execution**:

    Execute the provided Ansible playbook to configure the infrastructure:

    ```bash
    ansible-playbook tests/test.yml -i tests/inventory --syntax-check
    ```


## **Deployment Instructions**

1. **Initialize Terraform**:

    Navigate to the project directory and initialize Terraform:

    ```bash
    terraform init
    ```

2. **Plan the Deployment**:

    Review the changes Terraform will make:

    ```bash
    terraform plan
    ```

3. **Apply the Configuration**:

    Apply the Terraform configuration to deploy the infrastructure:

    ```bash
    terraform apply
    ```

4. **Configure with Ansible**:

    After Terraform successfully deploys the infrastructure, use Ansible to configure the virtual machines:

    ```bash
    ansible-playbook -i hosts playbook.yml
    ```

    Replace **`hosts`** with your inventory file and **`playbook.yml`** with the path to your main Ansible playbook.


## **Notifications**

This project is configured to send notifications to a specified webhook URL upon certain actions or events. Update the **`notifications`** section in the configuration file with your webhook URL.

## **Customization**

You can customize the Terraform modules and Ansible playbooks according to your project's requirements. Ensure to update the variables and resource names as needed to fit your organizational standards.

## **Security Considerations**

- Always follow best practices for managing secrets and credentials used in Terraform and Ansible.
- Review the network security group rules to ensure they adhere to your security policies.
- Regularly update the software and dependencies to their latest versions to mitigate vulnerabilities.
