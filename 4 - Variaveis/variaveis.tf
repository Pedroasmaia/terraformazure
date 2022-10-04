#! Criando variavel
variable "localtion" {
  type = string
  description = "Localização dos Recursos do Azure. Ex: Brasilsouth"
  default = "brazilsouth"
  ## Se comentarmos o default, se torna um input
}

#! Variavel do tipo maps
variable "tags" {
  type = map
  description = "Tags nos recursos"
  default = {
    "Ambiente" : "Desenvolvimento"
    "Responsavel" : "Pedro Maia"
    }
}

variable "name-rg" {
  type = string
  description = "Nome do grupo de recursos"
  default = "rg-teste"
}

#! Variavel tipo lists

variable "vnetadress" {
  type = list
  default = ["10.0.0.0.16","192.168.0.0/16"]
}

variable "env" {
  type = string
  description = "Ambiente do recurso"
}