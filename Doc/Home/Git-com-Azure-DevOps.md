# Git com Azure DevOps

🌐 [Documentação Util](www.dev.azure.com)

## Importância do versionamento do código

Versionar o código é a pratica de monitoramento da alteração do código, e porque isso é importante:
- Segurança
    - Evita corrompimento de arquivos
    - Apenas pessoas com acesso autorizado tem acesso á ele
    - Rastreabilidade
    - Rollback
- Colaboração

## Azure DevOps e seus serviços

O Antigo TFS mas agora disponibilizando 5 produtos dentro do mesmo PaaS:
- **Boards** serviço de Gerenciamento voltado para praticas ageis como Scrum, Kanbam
- **Pipelines** serviço de esteira de CI/CD
- **Repos** serviço de repositórios git ou Tfvc
- **Test Plans** serviço de testes, sendo eles automatizados, de carga entre outros.
- **Artifacts** compartilhar pacotes 

## Tipos de controle de versão

### Centralizado

- Já foi o tipo de versionamento mais utilizado
- Topologia em estrela, com apenas um repositório central

### Distribuido
- É o modelo mais utilizado
- Cada desenvolvedor tem uma copia do servidor, sem ficar depende dele

## Conceitos de Git

É um sistema de controle de versão.

- **Repositório** : Uma pasta onde estão os arquivos do nosso projeto.
- **Branchs** : São as ramificações do nosso código
- **Merge** : Mesclar as ramificações
- **Commits** : Toda a alteração que fazemos na branch

## Principais comandos Git

- Iniciando Repositório
~~~powershell
git init
~~~
- Clonando um repositório na sua máquina
~~~powershell
git clone "link"
~~~
- Verificando o Status
~~~powershell
git status
~~~
- Adicionando Arquivos no repositorio
~~~powershell
git add "nome_do_arquivo.txt"
~~~
- Listar Branchs locais e remotas
~~~powershell
git branch -a
~~~
- Criar novas Branchs
~~~powershell
git branch nomedabranch
~~~
- Deleta a Branch
~~~powershell
git branch -d nomedabranch
~~~
- Entrar na Branch
~~~powershell
git checkout nomedabranch
~~~
- Enviar Branch para o repositorio Remoto
~~~powershell
git push
~~~
- Atualiza o repositorio local para o Commit mais recente
~~~powershell
git pull
~~~

## Code Review e Pull Requests

- Compartilhamento de conhecimento
- Achar uma solução melhor para o negocio
- Distribuir responsabilidade
