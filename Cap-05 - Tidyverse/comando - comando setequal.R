# Esse comando nos auxilia a verificar se duas tabelas de dados possuem linhas
# com os mesmos valores independentemente da ordem em que tais valores se 
# apresentam

# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados1= readr::read_csv2(file="dataset/vendas.csv")
head(dados1)

library(magrittr)
library(dplyr)

# Criando x essencialmente igual a dados1 e y diferente de dados1
x = dados1 %>% filter(valor_compra > 0)
x

y = dados1 %>% filter(valor_compra > 500)
y

# Testando se as tabelas são iguais
setequal(x, dados1)
setequal(y, dados1)

# Unindo as colunas de y e x
z = full_join(y,x)
z

setequal(z, dados1)

# Observe => Que a forma como x e y foram construídas produziu x exatamente 
# igual a dados1 enquanto z foi construído de forma que a ordem nas linhas não
# as mesmas de dados1, mas os valores são os mesmos, portanto, é o mesmo 
# conjunto de dados em outra ordem.