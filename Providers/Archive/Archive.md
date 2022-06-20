# Provider Archive

- Link da documentação: [https://registry.terraform.io/providers/hashicorp/archive/latest](https://registry.terraform.io/providers/hashicorp/archive/latest)
- Consultar arquivo [Archive.tf](/Terraform/Terraform%20no%20Azure%20Infraestrutura%20como%20C%C3%B3digo%20e%20DevOps/Providers/Archive/Archive.tf
## Como utilizar esse provider:

~~~terraform
    terraform {
    required_providers {
        archive = {
        source = "hashicorp/archive"
        version = "2.2.0"
        }
    }
    }

    provider "archive" {
    # Configuration options
    }
~~~
