# CI CD da Infraestrutura

🗂️ [Diretório](https://dev.azure.com/pedroasmaia/Meus%20Estudos/_git/terraformazure?path=/10%20-%20CI-CD%20da%20Infraestrutura)

# Azure Devops no ciclo de desenvolvimento

Tabela demonstra como os serviços do Azure DevOps podem nos ajudar em cada estágios:

| Fase do Devops | Serviço do Azure        |
| -------------- | ----------------------- |
| Plan           | Boards                  |
| Code           | Repo                    |
| Build          | Pipelines               |
| Test           | Pipelines e Teste Plans |
| Release        | Pipelines               |
| Deploy         | Pipelines               |
| Operation      |                         |

## Workflow Pipelines e Integração Contínua

Workflow:

- Ter um repositório
- Realizar o Build, fazendo de modo manual ou via um gatilho
- Realizar testes automatizado
- Publicar

## Integração Continua (CI)

Está contido em Pipelines/Pipelines
- Code
- Build
- Teste

## Entrega Continua (CD)

Está contido em Pipelines/Releases
- Teste
- Release
- Deploy

Existem duas formas de realizar a configuração, utilizando a interface ou a linguagem YAML

## Conceitos do Pipelines utilizando editor clássico (interface)

- Trigger : Um gatilho para iniciar a compilação da nossa aplicação. É possível configurar também por períodos
- Agentes: São os servidores que vão processar e executar as ações necessárias, e podemos ter mais de um por pipeline
- Tarefas: É o menor componente das pipelines e podem ser agrupadas para salvar tarefas repetitivas
- Artefato: É o produto do código.


