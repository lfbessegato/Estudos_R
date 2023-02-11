#### O COMANDO DISTINCT
# Para extrair as observações distintas de uma tabela de dados usamos distinct.
# Numa base de dados pode ocorrer que uma ou mais linhas apresentem a mesma 
# informação. Esse comando eliminará essas linhas, resultando numa tabela 
# resultando apenas linhas de dados que sejam distintas entre si.

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados2 = readr::read_csv2(file="dataset/vendas.csv")
head(dados2)


library(magrittr)
library(dplyr)

# Extraindo as linhas distintas para filial
dados2 %>%
  distinct(filial)

# Extraindo as linhas distintas para a coluna n_itens
dados2 %>%
  distinct(n_itens)

# Extraindo as linhas distintas para as colunas filial, quinzena e desconto_perc
dados2 %>%
  distinct(filial, quinzena, desconto_perc)

