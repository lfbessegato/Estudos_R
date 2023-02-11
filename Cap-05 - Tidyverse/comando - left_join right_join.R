# A tabela final será o resultado de todas as colunas da tabela á esquerda ou á
# direita, que tenham correspondente na outra tabela e que possuam pelo menos
# uma coluna em comum, a coluna chave,

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados1= readr::read_csv2(file="dataset/vendas.csv")
head(dados1)

library(magrittr)
library(dplyr)

######## EXEMPLO 1
# Criando duas tabelas x e y a partir de dados1
x = dados1 %>% select(cupom, filial, valor_compra) %>%
  filter(valor_compra > 500)
x

y = dados1 %>% select(filial, n_itens) %>%
  filter(n_itens < 8)
y

# Unindo x e y pelas colunas de x (x à esquerda)
left_join(x,y)

# Unindo x e y pelas colunas de y (y à direita)
right_join(x,y)

# Observe => Que filial é a coluna chave. Ao juntar x e y pela esquerda, a 
# tabela final resultou nas colunas de x que possuem correspondente em y, 
# quatro combinações para filial B e uma para filial C. Ao juntar x e y pela
# direita a tabela final resultou nas colunas de y que possuem correspondente em
# x: cinco combinações para filial A, quatro combinações para filial B e uma 
# combinação para filial C. Filial A só possui correspondente em y, portanto não
# há correspondente em x para as colunas cupom e valor_compra quando filial é
# igual a A e portanto a tabela final nessa situação é preenchida com NA.