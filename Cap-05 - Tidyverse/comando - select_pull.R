#### O COMANDO SELECT
# Selecionando as colunas desejadas, filial, quinzena e por último valor_compra

# Lendo Arquivos 
# Acessando através de URL, através read_csv2
dados = read.csv2(file=
                    "https://raw.githubusercontent.com/lucianea/Alta/master/vendas.csv")
head(dados)

# Acessar via readr, através read_csv2
dados2 = readr::read_csv2(file="dataset/vendas.csv")
head(dados2)

library(magrittr)
library(dplyr)
dados2 %>%
  dplyr::select(filial, quinzena, valor_compra)

#### O COMANDO PULL
# Extrai uma coluna de uma tabela de dados na forma de um vetor. Podemos 
# identificar a coluna a ser extraída pelo nome ou pela posição.

# Extraindo a e da fdilial de dados2
vetor1 = dados2 %>% pull(filial)
vetor1

# A mesma extração agora usando a posição da coluna filial da esquerda para a 
# direita
vetor2 = dados2 %>% pull(2)
vetor2

# A mesma extração agora usando a posição da coluna filial da direita para a 
# esquerda.
vetor3 = dados %>% pull(-5)
vetor3

# A diferença entre usar pull e select é que no segundo caso o objeto terá a 
# forma de um tibble (uma tabela de dados). Além disso com select podemos 
# selecionar mais de uma coluna, enquanto que no pull isso não será possível.
dados2 %>% pull(filial)

dados2 %>% select(filial)

