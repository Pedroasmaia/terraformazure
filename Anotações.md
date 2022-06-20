## Módulo 1 | Introdução ao IaC e Azure Cloud

### Principais recursos

#### Analytics

- **Azure Databricks:** É um serviço de analise rápida e colaborativa, baseado no *Apache Spark* voltado para *AI* e *Big data*
- **Azure Stream Analytics:** É um serviço de analise em tempo real sobre demanda para *IoT*
- **Azure Datafactory** É um *ETL* na nuvem

##### Armazenamento

- **Storage Account:** É um serviço de armazenamento altamente disponível e redundante.
- **Blob Storage:** É um serviço de armazenamento para dados não estruturados.

##### Databases

- **SQL SERVER:** SQL servers em máquinas virtuais.
- **Azure Cosmos DB:** Serviço de dados multi-modelo distribuído globalmente
- **Azure Cache for Redis:** Armazenamento de dados em memoria compatível com software livre e totalmente gerenciado
- **Armazenamento de tabelas:** Repositório de chave-valor *NoSQL* semi estruturados

##### Computação

- **Máquinas virtuais:** O Nome é autoexplicativo.
- **VMSS:** Conjunto de escalonamentos de Máquinas virtuais
- **Azure Function:** Criar aplicativos com arquitetura *Serveless*
- **App Service:** Aplicativos de Nuvem
- **Batch:** Agendamento de trabalho
- **AKS:** Kubernetes

### Regiões Azure e Resource Group(Grupo de Recursos)

- **Conceito de Região do Azure:** É um conjunto de Datas Centers implantados dentro de um perímetro, de latência definida e conectada por uma rede regional dedicada de baixa latência.
  - [Regiões disponíveis](https://docs.microsoft.com/pt-br/azure/availability-zones/az-overview)
-**Conceito de Grupo de Recurso:** É um agrupamento de *recursos*(serviços), para controla-los melhor.
  - Os *recursos* de um *grupo de recursos* deve compartilhar o mesmo ciclo de vida.
  - Os *recursos* podem ser adicionados ou removidos dos *grupos de recursos*, a qualquer momento, mas nunca estar em dois grupos ao mesmo tempo.
  - Os *recursos* podem estar em *regiões* diferentes mesmo estando no mesmo *grupo de recursos*.
  - *Recursos* de grupos diferentes podem interagir entre sí.
- **Tags:** Categorização dos recursos.
- **Locks:** Bloqueios em cada recursos (ex: bloquear exclusão acidental).
- **IAM:** Controle de Acesso por recurso.

### Infraestrutura como Código IAC

- É um script para provisionamento de recursos
- Automatizando o provisionamento, entregando os recursos mais rápidos
- Validar a qualidade da nossa infraestrutura

### Como provisionar os recursos no Azure

- Portal do Azure
- Deploy via *PowerShell*
- Azure CLI (Comand Line Interface)
- Azure Cloud Shell
- ARM (AZURE RESOURCE MANAGER) - IAC
- Terraform - IAC
- [API REST do Azure](https://docs.microsoft.com/en-us/rest/api/) via requisições.

### Comparando ARM com Terraform

#### **ARM:**

- **Vantagens:**
  - É possível criar recursos a partir de outros já provisionados pelo portal
  - *Azure Quickstart templates* Templates disponíveis no github
- **Desvantagens:**
  - Ruim para leitura humana
  - Funciona somente na Azure

### Infraestrutura: Provisionamento x Configurações

- Provisionamento: Criar, alterar e excluir recursos.
- Configurações: Terraform não faz, mas é bom conhecer o *Ansible*

## [Módulo 2 | Terraform - Básico:](./2-Terraform%20Basico/)

### Terraform

- Significa de *Modelar a Terra*
- Ferramenta declarativa de provisionamento automatizado
- Lançamento em Maio/2014
- Linguagem própria chamada *HCL*
- Extensão .tf
- Multiprovedor
- Curva de aprendizagem baixa
- Foi desenvolvido usando *GO*
- Link para download: [https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
- Sempre colocar o executável nas variáveis de ambiente

### Como o Terraform funciona

O Terraform contem dois componentes principais:

- **Core:** O Centro do Terraform, e temos duas entradas principais:
  - As *configurações* que damos a ele, do que será configurado na nossa infraestrutura
  - E o *State* o estado atual do setup

    ~~~terraform
        terraform plan
        #É aqui que ele faz a comparação do que vai ser alterado
    ~~~

- **Providers:** Os provedores que convertem o nosso código em serviços

### Componentes do Terraform

- Terraform Executável
- Arquivos terraform, contendo duas extensões:
  - tfvars: Que contem as variáveis.
  - .tf: arquivos lidos pelo terraform.
- Plugins(Opcionais), que interagem com nossos *providers*
- Terraform.state, serve para salvar o estado do terraform

### Estágios do Terraform

- Terraform Init: Inicia o Terraform, baixando os providers e recursos declarados.
- Terraform Validate: Aponta os erros na codificação.
- Terraform Plan: Indica as modificações na infraestrutura constante no tfstate, criações, modificações e exclusão de recursos.
  - Terraform Plan --destroy: Planeja a exclusão da infraestrutura.
- Terraform Apply: Efetua o provisionamento
- Terraform Destroy: Destrói toda a infraestrutura no código.
- Terraform Show: Fornece saída legível a partir do tfstate.

### Estrutura do arquivo .TF

- Linguagem Declarativa
- Conferir arquivo: [Estrutura.tf](./2-Terraform%20Basico/Estrutura.tf)

### Providers

- É um componente responsável por interagir com as APIS.
- Utilitários locais para tarefas(Exemplo gerar números randômicos)

### Terraform Show

- É possível demonstrar o estado atual da infraestrutura em formato json utilizando o comando:

### Terraform Apply

- É possível pular o passo de aprovação com o Comando:

~~~terraform
  terraform apply -auto-approve
~~~

### Terraform FMT

- Faz a identação do código do terraform com o comando:

~~~terraform
  terraform fmt
~~~

### Trabalhando com Multiprovedor

- Basta inserir em Required Providers
- Consultar pasta [Multiproviders](./Providers/Multiproviders)

## [Módulo 6 | Terraform - Remote State:](./6-Remote%20State/)

- O Estado do Provisionamento fica salvo em um arquivo chamado *terraform.state*
- Salvando ele de forma remota trás alguns benefícios:
  - A possibilidade de travar alguns recursos (Como Locks de tabelas em SQL).
  - Trabalhar em equipe.
- Trabalhando com Azure iremos utilizar o *Azure Blob Storage*.

### Azure Storage

- Tipos de armazenamento:
  - Standard:
    - Blob.
    - Table.
    - File.qq
    - Queue.
  - Premium:
    - VM Disk.
- Características:
  - Durável.
  - Redundância.
  - Replicar dados por Data Center.
  - Criptografados pelo serviço.
  - Escalonável.
  - Controle de Acesso.
  - Acessível por *HTTP* ou *HTTPS*.
- O Ponto de acesso é sempre: http>//{account}.blob.core.windows.net/{container}/{blobname}

### Backend Terraform

O Backend do terraform identifica onde o Estado é armazenado e onde suas operações são realizadas.

### Azure Cloud Shell

É uma opção de shell no navegador, podendo escolher entre *powershell* e o *Bash* para escrever.

### Configurando o Remote Backend

- Consultar arquivo: [main.tf](./6-Remote%20State/main.tf)

### Provisionando *Storage Account*

- Consultar arquivo: [blobstorage.tf](./6-Remote%20State/blobstorage.tf)
- Consultar a documentação: [azurerm_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account)

## [Módulo 7 | Terraform - Organizando o Terraform](./7-Organizando/)

