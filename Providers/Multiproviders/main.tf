terraform {
  required_providers {
      archive = {
            source = "hashicorp/archive"
      }
      random = {
          source = "hashicorp/random"
      }
  }
}

resource "random_string" "string" { #Ira gerar uma string aleatoria
    length = 5 # Quantos Caraceteres aleatorios tera
    special = false  #Autoriza Caracteres Especiais
}

data "archive_file" "arquivozip" { #Compacta o arquivo
  type = "zip" #Define o tipo do arquivo 
  source_file = "data_backup/data.txt" #Define o arquivo fonte
  output_path = "backup.zip" #Onde o arquivo sera salvo
}

output "arquivozip" {
  value = "Zipado com sucesso!"
}

output "random_string" {
    value = random_string.string.result
}