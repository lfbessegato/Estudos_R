# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados1= readr::read_csv2(file="dataset/vendas.csv")
head(dados1)

library(magrittr)
library(dplyr)

########## EXEMPLO 1
# Criando duas tabelas x e y a partir de dados1
x = dados1 %>% select(cupom, filial, valor_compra)
x

y = dados1 %>% select(cupom, n_itens)
y

# Unindo x e y pelas colunas
bind_cols(x,y)

# Observe => Que as tabelas x e y foram coladas lado a lado, como a coluna cupom
# apresenta o mesmo nome em x e y, foi acrescentado o valor 1 ao seu nome na 
# tabela final.Para fazer essa combinação é necessário que o número de linhas
# seja igual em x e y, caso contrário retornará uma mensagem de erro.

####### EXEMPLO 2
# Criando duas tabelas x1 e y1 a partir de dados1
x1 = dados1 %>% select(cupom, filial, valor_compra) %>%
  filter(filial == "A")
x1

y1 = dados1 %>% select(cupom, n_itens) %>%
  filter(n_itens == 1)
y1

# Unindo x1 e y1 pelas linhas
bind_rows(x1, y1)

# Observe => Que as tabelas x e y foram coladas uma sobre a outra: a tabela 
# final apresentará as colunas tanto de x como de y.Note que a tabela final
# contém 4 colunas que são a soma do número de colunas de x e y menos o 
# número de colunas comuns, no caso uma coluna.Para fazer essa combinação não
# é necessário que o número de linhas ou colunas seja igual em x e y. Quando
# não há correspondência o comando retorna NA.