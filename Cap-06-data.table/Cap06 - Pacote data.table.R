# OBJETIVO
# Nesse capítulo, será introduzido ao pacote data.table e aprenderá a manipular
# uma base de dados com funções desse pacote. Ao final, estará apto a criar 
# scripts para manipulação de uma base de dados, utilizando-se da filosofia do
# pacote data.table.

# O pacote data.table segue outra filosofia, apesar de nos levar ao mesmo 
# objetivo final que é a manipulação dos dados.

# Utilize inicialmente a função data.table() para transformar o dataframe 
# tradicional num objeto tipo dataframe manipulável por esse pacote.

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados = readr::read_csv2(file="dataset/vendas.csv")

# Visualizando as 6 primeiras linhas da tabela
head(dados)

library(data.table)

# Transformando dados num data.table
dt = data.table::data.table(dados)

# Vamos agrupas os dados em dt por filial e realizar a contagem em cada grupo 
# utilizando o argumento .N.
library(data.table)

dt [ , .N, by = filial]

# Para visulalizar as três primeiras linhas de dt, utilize:
dt[1:3]
