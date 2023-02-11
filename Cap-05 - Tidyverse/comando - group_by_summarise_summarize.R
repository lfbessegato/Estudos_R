#### OS COMANDOS SUMMARISE E GROUP_BY
# O summarize ou summarise nos permite responder perguntas sobre nossos dados 
# através da aplicação de funções que resumem as variaáveis, possibilitando-nos 
# produzir tabelas resumidas do banco de dados.
# Essa função reduzirá um vetor em um número: podemos obter o comprimento do 
# vetor, o número de observações distintas do vetor, sua média, desvio-padrão e 
# muito mais.

# Lendo Arquivos 

# Acessando através de URL, através read_csv2
dados = read.csv2(file=
                    "https://raw.githubusercontent.com/lucianea/Alta/master/vendas.csv")
head(dados)

# Acessar via readr, através read_csv2
dados2 = readr::read_csv2(file="dataset/vendas.csv")
head(dados2)

library(magrittr)
library(dplyr)

# Observando o número de observações da base de dados
dados2 %>%
  summarise(contagem=n())

# Observando o número de filiais distintas
dados2 %>%
  select(filial) %>%
  summarise(filiais_distintas = n_distinct(filial))

# Observando o número de cupons distintos na filial B
dados2 %>%
  select(filial, cupom) %>%
  filter(filial == "B") %>%
  summarise(cupons_distintos = n_distinct(cupom))

# Podemos agrupar os dados de acordo cum uma coluna e obter resumo para os 
# grupos da mesma forma que obtemos para o vetor.
# Para agruparmos os dados usamos o comando group_by do pacote dplyr.

# Observando o número de cupons distintos por cada filial
dados2 %>%
  group_by(filial) %>%
  summarize(cupons_distintos = n_distinct(cupom))

# Obervando o total de compras por cada filial
dados2 %>%
  group_by(filial) %>%
  summarize(compra_total = sum(valor_compra))

# Observando o total de itens vendidos por cada filial
dados2 %>%
  group_by(filial) %>%
  summarize(item_total = sum(n_itens))

# Podemos sumarizar as informações de um grupo em mais de uma coluna
# Observando o número de cupons vendidos, o total de itens vendidos e o total do
# valor de compras em cada filial.
dados2 %>%
  group_by(filial) %>%
  summarise(
    cupons_distintos = n_distinct(cupom),
    item_total = sum(n_itens),
    compra_total = sum(valor_compra)
  )

# Podemos ainda obter a média e o desvio-padrão da coluna valor_compra agrupado
# por quinzena
dados2 %>%
  group_by(quinzena) %>%
  summarise(media = mean(valor_compra))

# Suponha que desejamos obter a média com arredondamento de 2 casas decimais
dados %>% 
  group_by(quinzena) %>%
  summarise(media = mean(valor_compra)%>%
              round(2))

# Agora, acrescente mais uma coluna com o desvio-padrão da idade de cada grupo
dados %>%
  group_by(quinzena) %>%
  summarise(media = mean(valor_compra) %>%
              round(2), 
            desv_pad = sd(valor_compra) %>%
              round(2)
  ) 

### Funções que se aplicam a vetores e retornam um único número podem ser utili-
# zadas em conjunto com summarise, destacamos aqui as principais:
# mean()
# quantile()
# sd()
# var()
# min()
# max()
# sum()
# prod()