#### OS COMANDOS ADD_COLUMN, ADD_ROW E RENAME

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados2 = readr::read_csv2(file="dataset/vendas.csv")
head(dados2)

# Suponha que precise adicionar uma coluna em dados2 com o número da linha na 
# tabela

library(magrittr)
library(dplyr)

# Adicionando uma nova coluna com números de 1 a 23
dados2 %>%
  tibble::add_column(adicionada=1:23)

# Adicionando antes da coluna 1. Pode também informar o nome da coluna no lugar 
# do número (.before = "cupom")
dados2 %>%
  tibble::add_column(adicionada=1:23, .before=1)

# Adicionando depois da coluna 2
dados2 %>%
  tibble::add_column(adicionada=1:23, .after=2)

# Suponha que precise adicionar uma linha em dados2 referente a outro cupom de 
# número 100 da filial A na primeira linha.
dados2 %>%
  tibble::add_row(cupom = 100, filial = "A",
                  valor_compra = 10, n_itens = 1, 
                  desconto_perc = 0, quinzena = 1, 
                  .before = 1)

# E finalmente, se deseja renomear uma coluna use rename, informando o novo nome
# e qual coluna será nomeada

# Renomeando a coluna valor_compra para venda
dados2 %>%
  rename(venda = valor_compra)

# Renomeando várias colunas
dados2 %>%
  rename(x1 = cupom, x2 = filial, x3 = valor_compra)

