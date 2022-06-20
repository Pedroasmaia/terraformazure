terraform {
  required_providers {
    random = {
        source = "hashicorp/random"
    }
  }
}

resource "random_string" "string" { #Ira gerar uma string aleatoria
    length = 10 # Quantos Caraceteres aleatorios tera
    special = true #Autoriza Caracteres Especiais
}