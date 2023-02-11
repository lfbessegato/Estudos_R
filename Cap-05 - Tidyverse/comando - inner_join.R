# A tabela final será o resultado da intersecção das colunas de x e y que 
# possuam pelo menos uma coluna em comum, a coluna chave.

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados1= readr::read_csv2(file="dataset/vendas.csv")
head(dados1)

library(magrittr)
library(dplyr)

######## EXEMPLO 1
# Criando duas tabelas x e y a partir de dados1
x = dados1 %>% select(cupom, filial, valor_compra)
x

y = dados1 %>% select(cupom, filial, n_itens)
y

# Unindo x e y pela intersecção da coluna chave
inner_join(x,y)

# Observe => Que a coluna chave para juntar as tabelas por intersecção são as
# colunas (cupom e filial). Esse comando une x e y através da intersecção dessas
# colunas.

#### EXEMPLO 2
# Criando duas tabelas x e y a partir de dados1
x1 = dados1 %>% select(cupom, filial, valor_compra) %>%
  filter(valor_compra > 500)
x1

y1 = dados1 %>% select(filial, n_itens) %>%
  filter(n_itens < 8)
y1

# Unindo x e y intersecção da coluna chave
inner_join(x1,y1)

# Observe => Que a coluna (filial) é a coluna chave para a intersecção entre 
# x e y. Em x temos filial B e C e em y temos a filial A, B e C, portanto B e C
# formam a intersecção da tabela final.