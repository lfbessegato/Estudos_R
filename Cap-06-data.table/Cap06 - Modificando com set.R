# Modifique valors, nome de colunas, ordem das linhas ou colunas com o comando 
# set, setnamesm setorder, setcolorder

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados = readr::read_csv2(file="dataset/vendas.csv")

# Visualizando as 6 primeiras linhas da tabela
head(dados)
library(data.table)

# Transformando dados num data.table
dt = data.table::data.table(dados)

# Modificando o valor da linha linha 1 e coluna 3
set(dt, i=1, j=3, value = 999)
dt[1:3]

# Modifique o nome da coluna 3
setnames(dt, old = "valor_compra", new = "vendas")
dt[1, 1:3]

# Reordenando linhas de forma decrescente
setorder(dt, -vendas, n_itens)
dt[1:3, 1:4]

# Reordenando linhas de forma crescente
setorder(dt, cupom)
dt[1:3, 1:4]

# Reordenando colunas
setcolorder(dt, c(1, 3, 2))
dt[1:3, 1:4]
