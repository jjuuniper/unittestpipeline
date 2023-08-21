terraform{
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.56.0"
        }
    }
}

provider "azurerm"{
    features{
      
    }
}

terraform {
  backend "azurerm" {
    resource_group_name = "rg_tf_state"
    storage_account_name = "satfstatejuuniper"
    container_name = "ut-tfdata"
    key = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "tf_rg_reactapp" {
  name = var.az_rg
  location = "eastus"
}

resource "azurerm_service_plan" "tf_sp_reactapp" {
 name                = var.az_sp
 sku_name            = "B1"
 location            = "eastus"
 resource_group_name = azurerm_resource_group.tf_rg_reactapp.name
 os_type             = "Windows"
}

resource "azurerm_windows_web_app" "tf_appservice_reactapp" {
  name                = var.az_reactapp
  location            = azurerm_resource_group.tf_rg_reactapp.location
  resource_group_name = azurerm_resource_group.tf_rg_reactapp.name
  service_plan_id     = azurerm_service_plan.tf_sp_reactapp.id

  site_config {
    
  }
}