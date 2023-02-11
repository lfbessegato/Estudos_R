# Esses comandos servem para realizar operações de intersecção, união e dife-
# rença nas linhas de duas tabelas.

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

y = dados1 %>% select(cupom, filial, valor_compra) %>%
  filter(valor_compra < 700)
y

# Obtendo a intersecção
intersect(x, y)

# Obtendo a união
union(x, y)

# Obtendo a diferença, tudo que está em x e não está em y
setdiff(x, y)

# Obtendo a diferença, tudo que está em y e não está em x
setdiff(y, x)

# Observe que em x temos três linhas, e em y temos 21 linhas. Ao fazer a 
# intersecção vemos que apenas uma linha se repete em x e y. Ao fazer a união
# temos 23 linhas, ou seja, a somas das linhas de x e y (24) menos a quantidade
# que se repete (1). Ao fazer a diferença temos duas linhas que só se observam 
# em x e 20 linhas que só se observam em y.