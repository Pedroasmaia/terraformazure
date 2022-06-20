terraform {
  required_providers {
      archive = {
      source = "hashicorp/archive"
      }
  }
}
data "archive_file" "arquivozip" { #Compacta o arquivo
  type = "zip" #Define o tipo do arquivo 
  source_file = "data_backup/data.txt" #Define o arquivo fonte
  output_path = "backup.zip" #Onde o arquivo sera salvo
}

output "arquivozip" {
  value = "Zipado com sucesso!"
}