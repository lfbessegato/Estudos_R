
# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados = readr::read_csv2(file="dataset/vendas.csv")

# Visualizando as 6 primeiras linhas da tabela
head(dados)

# Vejas como realizar operações de apuração de valores sobre as linhas de um DT

# Comando                             O que faz
# .N                                  Conta o número de linas
#
# DT[,.N, by = c(j1, ...,jn)]         Conta o número de linhas de acordo com os 
#                                     agrupamentos
# 
# DT[,.(f1(j, ..., fn(j)), by = j)]   Aplica diversas funções nas colunas
#                                     especificadas, de acordo com o agrupamento
#                                     da coluna j em by
#
# DT[,.(f1(j), ..., fn(j)), keyby=1   Aplica diversas funções nas colunas
#    .(j1, ..,jn)]                    especificadas, de acordo com o agrupamento
#                                     das colunas listadas j1,j2..., jn em keyby

library(data.table)

# Transformando dados num data.table
dt = data.table::data.table(dados)

# Contando o número de observações por filial
dt[ , .N, by = filial]

# Fornecendo um nome para a coluna de contagem
dt[ , .(contagem = .N), by = filial]

# Contando o número de observações por filial, ordenndo pela contagem
dt[ , .N, by = filial][order(N)]

# Calcula a média da coluna valor_compra de acordo com grupos da coluna filial
dt[ , .(venda_media_por_cupom=mean(valor_compra)), by = filial]

# Calcula a média da coluna valor_compra de acordo com os grupos da coluna 
# filial e quinzena
dt[ , .(venda_media_por_cupom=mean(valor_compra)), keyby = .(filial, quinzena)]

# Calcula a média da coluna valor_compra de acordo com os grupos da coluna
# filial e quinzena, considerando apenas a quinzena 1.
dt[quinzena == 1 , .(venda_media_por_cupom=mean(valor_compra)), keyby = .(filial, 
                                                             quinzena)]
