#### OS COMANDOS MUTATE E TRANSMUTE
# Através do comando mutate é possível criar novas colunas na base de dados. 
# Vamos incluir em dados2 uma coluna denominada vmci que contenha o valor médio
# de compra por item, isto é: 
# vmci = valor_compra / n_itens

# Lendo Arquivos 

# Acessando através de URL, através read_csv2
# Acessar via readr, através read_csv2
dados2 = readr::read_csv2(file="dataset/vendas.csv")
head(dados2)


# Carregue sempre o pacote no inicio do seu script
library(magrittr)
library(dplyr)

# Criando uma nova coluna vmci
dados2 %>%
  mutate(vmci = valor_compra / n_itens)

# Aplicando um arredondamento na nova coluna vmci de dados2 e ordenando por ela.
dados2 %>%
  mutate(vmci = round(valor_compra / n_itens,2)) %>%
  select(filial, valor_compra, n_itens, vmci) %>%
  arrange(vmci)

# O comando transmute realiza o mesmo que o mutate, porém não adiciona a nova 
# variável às colunas originais.

# Criando uma nova coluna vmci
dados2 %>%
  transmute(vmci = valor_compra / n_itens)

# Selecionando algumas colunas para visualização
dados2 %>%
  transmute(filial, valor_compra, n_itens, vmci = 
              round(valor_compra / n_itens,2))

# Com mutate podemos acrescentar novas colunas aos dados originais, já com o 
# transmute criamos novas colunas a partir dos dados originais.

