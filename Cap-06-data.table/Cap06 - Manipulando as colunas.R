
# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados = readr::read_csv2(file="dataset/vendas.csv")

# Visualizando as 6 primeiras linhas da tabela
head(dados)

# Vejas as possibilidades de como selecionar as colunas de um DT

# Comando                             O que faz
# DT[,j] ou DT[[j]]                   Seleciona a coluna j e retorna um vetor 
#
# DT[,list(j)] ou DT(,.(j)]           Seleciona a coluna j e retorna um data.table
# 
# DT[,-c(j1,j2 ...,jn)]               Exclui as colunas listadas j1, j2 ...,jn  
#
# DT[,.(j1,j2, ...,jn)]               Retorna as colunas listadas j1, j2, ...,jn
# 
# DT[,.(nome_escolhido = função(j))]  Aplica a função especificada á coluna j
#                                     retorna um data.table.
#
# DT,.(nome1=f(j1), nome2=f(j2),      Aplica várias funções a várias colunas e 
#     ...,nomen=f(jn))]               retorna um data.table
#
# DT[, novacol := vetor]              Adiciona uma nova coluna
# 
# DT, c("Col1","Col2",...,"Coln")     Adiciona várias novas colunas
# := c(vetor1, vetor2, ..., vetorn)]

library(data.table)

# Transformando dados num data.table
dt = data.table::data.table(dados)

# Exibindo as 2 primeiras linhas da coluna 3
dt[1:2, 3]

# Exibindo as duas primeiras linhas das colunas de 1 a 3
dt[1:2, 1:3]

# Exibindo as duas primeiras linhas das colunas 1, 2, 6
dt[1:2, c(1,2,6)]

# Excluindo a coluna quinzena (exibindo as 2 primeiras linhas)
dt[1:2, -"quinzena"]

# Excluindo a coluna quinzena e desconto_perc (exibindo as 2 primeiras linhas)
dt[1:2, -c("quinzena", "desconto_perc")]

# Criando uma nova coluna com valor repetido em todas as linhas e exibindo as 
# linhas 1 e 2 e colunas 6 e 7
dt[ , novacol := 1][1:2, 6:7]

# Removendo uma coluna
dt[, novacol := NULL][1:2]

# Obtendo a média e o desvio padrão de valor_compra
dt[ , .(media = mean(valor_compra), desv_pad = sd(valor_compra))]

# Obtendo a soma de valor_compra, n_itens e desconto_perc
dt[ , .(s1=sum(valor_compra), s2=sum(n_itens), s3=sum(desconto_perc))]
