# O pacote possui um símbolo especial denotado por .SD para realizar operações 
# em um subconjunto de dados de DT, de acordo com o grupo definido em by. 
# Portanto DT[ , .SD] é o conjunto de dados completo, já DT[ , .SD, by = j] é 
# o subconjunto completo dos dados exceto pela coluna j, formando subconjuntos 
# para cada grupo da coluna j. É possível ainda definir as colunas do conjunto 
# completo que deverão se consideradas em .SD através do operador .SDcols.

# Para obter o valor médio das compras em cada grupo formado pelo par de colunas
# filial e quinzena, utilize lapply(.SD, mean) aplicada na coluna valor_compra
# fazendo .SDcols = "valor_compra", considerando-se o subconjunto de dados 
# definidos em by = .(filial, quinzena).

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados = readr::read_csv2(file="dataset/vendas.csv")

# Visualizando as 6 primeiras linhas da tabela
head(dados)
library(data.table)

# Transformando dados num data.table
dt = data.table::data.table(dados)

# Visualizando os subconjuntos da tabela por quinzena
dt[, print(.SD), by = quinzena]

# Aplicando a média à coluna valor_compra por quinzena
dt[ , lapply(.SD, mean), .SDcols = "valor_compra", by = quinzena]

# Aplicando a média à coluna valor_compra por filial e quinzena
dt[ , lapply(.SD, mean), .SDcols = "valor_compra", by = .(filial, quinzena)]

# Aplicando a média às colunas valor_compra e n_itens por quinzena
dt[ ,lapply(.SD, mean), .SDcols = c("valor_compra", "n_itens"), 
    by = .(quinzena)][]

# Aplicando a média às colunas valor_compra e n_itens por filial e quinzena
dt[ ,lapply(.SD, mean), .SDcols = c("valor_compra", "n_itens"), 
    by = .(filial, quinzena)]

# Aplicando duas funções soma e média 
dt[ ,c(lapply(.SD, sum), lapply(.SD, mean)), .SDcols = "valor_compra", 
    by = .(quinzena)]
