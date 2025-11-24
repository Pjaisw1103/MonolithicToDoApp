rgs = {
  rg1 = {
    name       = "rg-dev-todoapp-01"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env = "dev"
    }
  }
}

networks = {
  vnet1 = {
    name                = "vnet-dev-todoapp-01"
    location            = "centralindia"
    resource_group_name = "rg-dev-todoapp-01"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

public_ips = {
  app1 = {
    name                = "pip-dev-todoapp-01"
    resource_group_name = "rg-dev-todoapp-01"
    location            = "centralindia"
    allocation_method   = "Static"
    zones = ["1", "2", "3"]
    domain_name_label   = "app1-dns"
    tags = {
      app = "frontend"
      env = "dev"
    }
  }

  app2 = {
    name                = "pip-dev-todoapp-02"
    resource_group_name = "rg-dev-todoapp-01"
    location            = "centralindia"
    allocation_method   = "Dynamic"
    sku                 = "Basic"
    ip_version          = "IPv4"
    tags = {
      app = "backend"
      env = "staging"
    }
  }
}

key_vaults = {
  myKeyVaultdev01 = {
    kv_name             = "myKeyVaultdev01"
    location            = "centralindia"
    resource_group_name = "rg-dev-todoapp-01"
  }
}

key_vault_secret = {
  secret1 = {
    kvs_name  = "FrontPassword"
    kvs_value = "P@ssword123!"
    kv_name   = "myKeyVaultdev01"
  }

  secret2 = {
    kvs_name  = "BackApiKey"
    kvs_value = "1234-5678-ABCD"
    kv_name   = "myKeyVaultdev01"
  }
}

vms = {
  vm1 = {
    nic_name            = "nic-frontend-vm-01"
    location            = "centralindia"
    resource_group_name = "rg-dev-todoapp-01"
    vnet_name           = "vnet-dev-todoapp-01"
    subnet_name         = "frontend-subnet"
    pip_name            = "pip-dev-todoapp-01"
    nsg_name            = "nsg-frontend-vm-01"
    vm_name             = "frontend-vm"
    size                = "Standard_F2"
    script_name         = "install_nginx.sh"
    kv_name             = "myKeyVaultdev01"
    kvs_name            = "FrontPassword"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    nic_name            = "nic-frontend-vm-02"
    location            = "centralindia"
    resource_group_name = "rg-dev-todoapp-01"
    vnet_name           = "vnet-dev-todoapp-01"
    subnet_name         = "backend-subnet"
    pip_name            = "pip-dev-todoapp-02"
    nsg_name           = "nsg-backend-vm-01"
    vm_name             = "backend-vm"
    size                = "Standard_F2"
    script_name         = "install_python.sh"
    kv_name             = "myKeyVaultdev01"
    kvs_name            = "BackApiKey"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
