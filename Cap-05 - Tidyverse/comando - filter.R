#### O COMANDO FILTER
# Para filtrar dados é necessário conhecer alguns comandos lógicos:
# * Comparando igualdade: ==
# * Comparando diferença: !=
# * Comparando diferenças: >; <; >=; <=
# * Condições lógicas: & (e); | (ou); ! (negação)

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados2 = readr::read_csv2(file="dataset/vendas.csv")
head(dados2)

# Observe a aplicação dos filtros para filial e n_itens;
library(magrittr)
library(dplyr)

# Somente a filial A
dados2 %>%
  filter(filial == "A")

# Filial A ou n_itens igual a 1
dados2 %>%
  filter(filial == "A" | n_itens == 1)

# Filial B e quinzena 2
dados2 %>%
  filter(filial == "B" & quinzena == 2)

