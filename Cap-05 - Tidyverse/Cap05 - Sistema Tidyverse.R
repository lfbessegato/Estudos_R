# OBJETIVO
# Nesse capítulo será introduzido aos principais pacotes do sistema tidyverse.
# Realizando leitura e manipulação de dados. Aprenderá a identificar e
# converter os tipos de variáveis e manipular a base de dados. Ao final, 
# estará apto a criar scripts para manipulação de uma base de dados.

# Pacotes
# ggplot2 => Visualização de dados
# tibble => Dataframe
# tidyr => Organização dos dados
# readr => Leitura dos dados
# purrr => Programação Funcional
# dplyr => Manipulação dos dados

# tidyverse_update => Garantir que todos os pacotes estejam sempre atualizados

# install.packages("tidyverse")
library(tidyverse)
# tidyverse_update()

# Lendo Arquivos 

# Acessando através de URL, através read_csv2
dados = read.csv2(file=
            "https://raw.githubusercontent.com/lucianea/Alta/master/vendas.csv")
head(dados)

# Acessar via path, através read_csv2
dados1 = read.csv2(file="dataset/vendas.csv")
head(dados1) # visualiza as 6 primeiras linhas do objeto

# Acessar via readr, através read_csv2
dados2 = readr::read_csv2(file="dataset/vendas.csv")
head(dados2)

# Acessar via path, , através read_csv
dados3 = read.csv(file="dataset/vendas1.csv")
head(dados3)

# Acessar via readr, através read_csv
dados4=readr::read_csv(file="dataset/vendas1.csv")
head(dados4)

# Exibindo os dados que estão no formato tibble
dados2
print(dados2, n=15)

# Ajustando o numero de colunas a serem exibidas
# consulte a largura do documento 
getOption("width")

# Ajuste a largura a ser impressa
print(dados2, width = 35)

###### Criar uma tabela de dados com o comando tibble, o procedimento é 
# semelhante ao comando data.frame do pacote básico
library(tibble)

# Criando uma tabela com tibble
x1 = tibble(x = 1:3, y = 10:12, z = c("A1", "A2", "A3"))
x1

# Criando uma tabela com data.frame
x2 = data.frame(x = 1:3, y = 10:12, z = c("A1", "A2", "A3"))
x2

# Transformando x2 em tibble
x3 = as_tibble(x2)
is_tibble(x3)

####### Identificando e modificando o tipo da variável
# Para verificar o tipo, usamos 
#   is.numeric 
#   is.factor 
#   is.character 

# Para transformar usamos 
#   as.numeric
#   as.factor
#   asfactor

is.numeric(dados1$valor_compra)
is.numeric(dados2$valor_compra)
is.factor(dados3$filial)
is.character(dados$filial)

# Transformando a variável filial de dados1 de tipo caractere para o tipo fator
is.character(dados1$filial)

is.factor(dados1$filial)

dados1$filial = as.factor(dados1$filial)
is.character(dados1$filial)
is.factor(dados1$filial)

# Não é possível transformar uma variável de caractere diretamente em numérica.
# 1o) => Deve ser convertida para fator 
# 2o) => Já como fator, pode transformar para numérica

# Tranformando variável caractere em numérica
is.character(dados4$filial)

# Deve-se transformar de caractere para fator primeiro
filial = as.factor((dados3$filial))
filial
is.factor(filial)

# Os fatores são transformados em números inteiros de acordo com os níveis dos 
# fatores
filial =as.numeric(filial)
is.numeric(filial)
filial

# Transformando variáveis numérica em caractere
filial=as.character(filial)
is.character(filial)
filial

###### Operador PIPE
# Funciona como uma função de comando mais lógica e natural.
# Trata-se de um operador cuja notação é dada por %>%. Com eles é possível 
# encadear a linha de comando na ordem de execução.

# Modo tradicional sem uso do pipe
summary(dados2)

# Modo pipe
library(magrittr)
dados2 %>% summary()

# Imagine que em dados2 queremos selecionar a coluna filial1 e quinzena e depois
# visualizar apenas os resultados da quinzena 1.

# Carregamos o pacote no início do script
library(magrittr)

# Agora aplicamos o procedimento com o pipe
dados2 %>%
  dplyr::select(filial, quinzena) %>%
  dplyr::filter(quinzena == 1)


############ MANIPULANDO DADOS COM O DPLYR
# Nesse pacote temos disponíveis as seguintes funções

# * select() => Extrai as colunas de uma tabela de dados na forma de tabela.
# * pull() => Extrai uma coluna de uma tabela de dados na forma de um vetor.
# * filter() => Filtra linhas.
# * distinct() => Remove as linhas com valores repetidos.
# * arrange() => Reordena ou combina linhas.
# * mutate() ou transmute() => Cria novas colunas.
# * summarise() => Sumariza valores.
# * group_by() => Permite operações por grupo.
# * add_column() e add_row() => Adiciona novas colunas ou linhas.
# * rename() => Renomeia uma coluna.
head(dados2) # Visualiza as 6 primeiras linhas

