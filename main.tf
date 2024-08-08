# Define the Azure provider
provider "azurerm" {
  features {}
  # Optional: Define the Azure credentials (if not using Azure CLI)
  # Uncomment and replace with your actual values if using direct credentials
  # client_id       = "<YOUR_CLIENT_ID>"
  # client_secret   = "<YOUR_CLIENT_SECRET>"
  # tenant_id       = "<YOUR_TENANT_ID>"
  # subscription_id = "<YOUR_SUBSCRIPTION_ID>"
}

# Define a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resource-group"
  location = "West Europe"
}

# Define an App Service Plan
resource "azurerm_app_service_plan" "example" {
  name                = "example-app-service-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "App"
  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Define an App Service
resource "azurerm_app_service" "example" {
  name                = "example-app-service"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
}
