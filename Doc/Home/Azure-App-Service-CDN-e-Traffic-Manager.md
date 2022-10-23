# Azure App Service CDN e Traffic Manager

## Deployment Slots

Slots são ambientes de preparação que usamos para preparar testar e validar nossa aplicação, ou podemos usar também como balanceador de carga.

- Possuem uma URL própria.
- O Botão Swap, faz a passagem do codigo do slot para produção.
- É necessário que o Plano de Serviço seja acima do S1

### Usando Slots de Aplicação com terraform

🌐 [Documentação Util](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app_slot)

## Azure CDN

Rede de distribuição de conteúdo da Azure.

- É pago.
- Utiliza Cache para disponibilizar recursos.
- Usa ponto de presença para salvar o cache no ponto mais proximo do usuario.
- Diminuir as latência

### Usando o CND com Terraform

🌐 [Documentação Util](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_profile)

## Azure Traffic Manager

É um balanceador de trafego, baseado em DNS que permite distribuir o trafego por regiões de trafego.

### 5 Tipos de balanceamento

1. Priority: Pega o endpoint principal e envia para o usuario, caso falhe o proximo da lista será o endpoint retornado.
2. Weight: É uma métrica baseada em importancia, para retornar o endpoint mais adequado.
3. Performance: o Endpoint mais adequado é o retornado
4. Multi-value: Varios endpoints são mapeados para endereços de IP
5. Subnet: Nele o endpoint mapeado para um conjunto de endereço IP é retornado
6. Geographic: Os endpoints de regiões geograficas são voltados para internet 

### Provisionando com terraform

🌐 [Documentação Util](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_profile)
