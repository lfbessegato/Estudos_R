
# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados = readr::read_csv2(file="dataset/vendas.csv")

# Visualizando as 6 primeiras linhas da tabela
head(dados)

# Vejas as possibilidades de como selecionar linhas de um DT

# Comando                           O que faz
# DT[condições sobre as colunas]    Seleciona as linhas de DT que satisfazem as 
#                                   condições
#
# DT[1:k]                           Seleciona as linhas de 1 a K
# 
# DT[order(j1, j2)]                 Ordena os dados em ordem ascendente do vetor1
#                                   seguido por vetor2. Para ordem descendente use
#                                   sinal de menos antes do nome do vetor. 
#                                   Ex: DT[order(-j)]
#
# unique(DT) ou 
# unique(DT by = col. selecionadas) Seleciona as linhas distintas (elimina as 
#                                   repetidas considerando as col. selecionadas)
# 
# na.omit(DT,cols=col.selecionadas) Elimina as linhas com valores faltantes, 
#                                   considerando as colunas selecionadas.

# Podemos encadear as operações usando dt[...][...][...]

library(data.table)

# Transformando dados num data.table
dt = data.table::data.table(dados)

# Exibindo as linhas da filial A
dt[filial == "A"]

# Exibindo as linhas de 5 a 8
dt[5:8]

# Exibindo as linhas 1, 7 e 10
dt[c(1,7,10)]

# Exibindo as 3 primeiras linhas em ordem ascendente do valor_compra
dt[order(valor_compra)][1:3]

# Exibindo as 4 primeiras linhas em ordem descendente da filial e quinzena
dt[order(-filial, -quinzena)][1:4]

# Exibindo as linhas distintas considerando as colunas filial e quinzena
unique(dt, by=c("filial", "quinzena"))
