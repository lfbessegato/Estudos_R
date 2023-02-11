# A tabela final será  o resultado da união de todas as colunas de x e y, e que 
# possuam pelo menos uma coluna em comum, a coluna chave.

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados1= readr::read_csv2(file="dataset/vendas.csv")
head(dados1)

library(magrittr)
library(dplyr)

# Criando duas tabelas x e y a partir de dados1
x = dados1 %>% select(cupom, filial, valor_compra) %>%
  filter(valor_compra > 500)
x

y = dados1 %>% select(filial, n_itens) %>%
  filter(n_itens < 8)
y

# Unindo x e y pela união da coluna chave
full_join(x,y)

# Observe => Que a coluna filial é a coluna chave para a união entre x e y. Em
# x temos filial B e C e em y temos A, B e C; portanto A, B e C formam a união 
# na tabela final. As demais colunas se combinam a partir desta união: em B 
# temos dois valores distintos para valor_compra que se combinam com dois
# valores distintos para valor_compra que se combinam com dois valores distintos
# para n_itens, resultando em quatro combinações: em C tempos apenas um valor 
# em cada coluna, resultando em uma combinação e em A não temos correspondente 
# para as colunas de x que são cupom e valor_compra que são preenchidas com NA
# e, portanto, resultam em cinco linhas que correspondem aos valores em y da 
# coluna n_itens