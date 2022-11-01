# Provider Random

🌐 [Documentação Util](https://registry.terraform.io/providers/hashicorp/random/latest/docs)
Com ele podemos adicionar valores aleatórios.
- Consultar arquivo [Random.tf](/Terraform/Terraform%20no%20Azure%20Infraestrutura%20como%20C%C3%B3digo%20e%20DevOps/Providers/Random/Random.tf)
## Como utilizar esse provider:

~~~terraform
    terraform {
    required_providers {
        random = {
        source = "hashicorp/random"
        version = "3.2.0"
        }
    }
    }

    provider "random" {
    # Configuration options
    }
~~~
