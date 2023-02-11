#### O COMANDO ARRANGE
# Organiza os dados de acordo com a ordem de uma variável escolhida para 
# determinado fim

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados2 = readr::read_csv2(file="dataset/vendas.csv")
head(dados2)

library(magrittr)
library(dplyr)

# Organiza os dados pela ordem crescente de n_itens
dados2 %>%
  arrange(n_itens)

# Considerando um ordenamento decrescente:
# Organiza os pela ordem decrescente de n_itens
# Pode-se usar sinal de - antes de n_itens
dados2 %>%
  arrange(-n_itens)

# Podemos ainda rearranjar nossos dados:
# Ordenado pela ordem descrescente de n_itens e depois pela ordem alfabética de 
# filial
dados2 %>%
  arrange(-n_itens) %>%
  arrange(filial)

# Ordenando pela ordem decrescente de n_itens e ao mesmo tempo pela ordem 
# alfabética de  # filial
dados2 %>%
  arrange(-n_itens, filial)

# Podemos, ainda, filtrar os dados considerando algumas colunas de interesse:
# Ordenando os dados pelo n_itens e valor_compra, filtrando valor_compra maior 
# que 100 # e exibindo a seleção dessas colunas juntamente com a coluna filial 
# no início.
dados2 %>%
  arrange(n_itens, valor_compra) %>%
  filter(valor_compra > 100) %>%
  select(filial, n_itens, valor_compra)

