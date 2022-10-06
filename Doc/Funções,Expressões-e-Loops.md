# Funções, Expressões e Loops

🗂️ [Diretório](/7%20-%20Fun%C3%A7%C3%B5es%20Express%C3%B5es%20e%20Loops/)

🌐 [Documentação Util](https://www.terraform.io/language/functions)

## Funções para números

### min

Retorna o menor valor de uma lista de números.

~~~hcl
min(12,54,3)
#3
~~~

### max

Retorna o maior valor de uma lista de números.

~~~hcl
max(12,54,3)
#54
~~~

### sum

Para fazer operações de adição.

~~~hcl
sum([4, 50])
#54
~~~

## Funções para Strings 

### format

Podemos formatar e concatenar Strings.
~~~hcl
format("Olá, %s!","Pedro")
#Olá, Pedro!
~~~

### split

Podemos separar o texto passando um separador.

~~~hcl
split("," "foo,bar,braz")
#
"foo"
"bar"
"baz"
~~~

### replace

Realizar substituição nas strings.

~~~hcl
replace("1 + 2 + 3", "+", "-")
# 1 - 2 - 3
~~~

### length

Para saber o tamanho de caracteres em uma string.

~~~hcl
length("pedro")
#5
~~~

### title

Formata com apenas a 1° letra em caixa alta;

~~~hcl
title("JoAo DoRiA")
#Joao Doria
~~~

### upper

Formata todas as letras em caixa alta.

~~~hcl
title("JoAo DoRiA")
#JOAO DORIA
~~~

### lower

Formata todas as letras como minusculas

~~~hcl
title("JoAo DoRiA")
#joao doria
~~~


### concat

Concatena duas strings

~~~hcl
variable "vnetips" {
  type = list
  default = [ "10.0.0.0/16" ]
}

resource "azurerm_virtual_network" "vnetconcat" {
  name = "vnetconcat"
  location = "brazilsouth"
  resource_group_name = azurerm_resource_group.grupoexemplostrings.name
  address_space = concat(var.vnetips, ["192.168.0.10"])
}
# adress_space = ["10.0.0.0/16","192.168.0.10"]
~~~

## Funções para coleções

## list

Para criar uma lista.

~~~hcl
list("a","b","c")

#[ "a","b","c"]

~~~

## Funções de Enconding 

### base64encode

Passa String para formato base64

~~~hcl
base64encode("Hello World")
#SGVsbG8gV29ybGQ=
~~~

## Funções de Sistema

### file

Para ler um arquivo

~~~hcl
file("${path.module/hello.txt})
#Hello World
~~~

### fileexists

Para ler um arquivo

~~~hcl
fileexists("${path.module/hello.txt})
#true
~~~

## Funções de datas

### timestamp e formatdate

Retorna data atual

~~~hcl
resource "azurerm_resource_group" "grupoexemplo" {
  name = "grupo-exemplar"
  location = "brazilsouth"
  tags = {
    data = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }

# Recurso será provisionado com data atual, seguindo essa formatação
~~~

## Condicionais

Trabalhamos com verificação de falso ou verdadeiro usando o simbolo **?** para então e **:** para senão. Logica:

condição ?(então) true :(senão) false

~~~hcl

resource "azurerm_virtual_network" "vnetconditon" {
  name = "vnetconditon"
  location = "brazilsouth"
  resource_group_name = azurerm_resource_group.grupoexemplostrings.name
  address_space = length(var.vnetips) == 0 ? ["10.0.0.0/16","192.168.0.10"] : var.vnetips
}
# Será provisionado com apenas um ip de acordo com a condição
~~~

## Count

Aciona um contador

~~~hcl
resource "azurerm_resource_group" "grupoexemplocount" {
    count = 2
  name = "grupo-exemplar-${count.index}"
  location = "brazilsouth"
}

# Será provisionado dois recursos grupo-exemplar-0 e grupo-exemplar-1
~~~


## Dependências Implícitas

São detectadas automaticamente pelo terraform. Por exemplo, um Web App precisa de um service plan para existir:

~~~hcl
resource "azurerm_app_service" "example"{
    name = "example-app-service"
    location = azurerm_resource_group.examplerg.location
    resource_group_name = azurerm_resource_group.example.name
    app_service_plan_id = azurerm_app_service_plan.exampleplan.id
}
~~~

O Service Plan deve ser criado antes do app service.

## Dependência Explícita

São inseridas manualmente no código passadas pelo desenvolvedor usando o método depends_on:

~~~hcl
resource "azurerm_virtual_machine" "vm" {
  
  network_interface_ids = [azurerm_network_interface.nic.id]

  depends_on = [
    azurerm_network_interface_application_security_group_association.vm_asg_assoc
  ]
~~~

e podemos ver essa dependencias usando o comando terraform graph.


## For Each

Realiza iteração chave valor em uma variável do tipo map

