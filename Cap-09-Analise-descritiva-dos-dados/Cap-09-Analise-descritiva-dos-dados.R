################################################################################
# Capítulo 9 - Análise descritiva dos dados
# 
# Objetivo: Neste capítulo aprenderemos a fazer uma análise descritiva
# dos dados através da tabulação das variáveis e cálculo de medidas descritivas
# como média, desvio-padrão, entre outras.
################################################################################

# A análise descritiva dos dados se ocupa em obter informações preliminares como
# a contagem dos resultados observados em cada variável do conjunto de dados, 
# levando-se em conta sua natureza qualitativa (categórica) ou 
# quantitativa (numérica) uma vez que as propriedades descritivas dos dados 
# dependem dessa natureza.

############# TABULAÇÃO DOS DADOS
# Na etapa de tabulação, o pesquisador prepara as tabelas de frequência com o
# intuito de entender o comportamento das variáveis. 

# Leitura dos dados 
dados = read.csv2(file="dataset/vendas.csv")

# Exibindo as 6 primeiras linhas da base de dados
head(dados)

# Exibindo a estrutura dos dados
str(dados)

# Para construir as tabelas de frequência da variável qualitativa filial, faça:
library(janitor)

# Tabela de frequência variavel categórica
tabela_filial = tabyl(dados, filial) %>%
  adorn_totals() %>%
  adorn_rounding(2)

tabela_filial

# A tabela de frequência pode ser inserida no relatório usando o comando abaixo
knitr::kable(tabela_filial, align = "ccc")

# A tabela de frequência de variáveis numéricas, como é o caso de "valor_compra"
# precisa ser dividida em intervalos (classes), pois pode assumir tantos valores
# distintos quanto forem os números de observações da variável.
# Para fazer a divisão será usada a função "cut".
library(janitor)

# Cut para categorizar valor_compra em b intervalos
intervalo = (cut(dados$valor_compra, b=nclass.Sturges(dados$valor_compra)))

# Tabela de frequência da variável valor_compra
tabela_valor = tabyl(intervalo) %>%
  adorn_totals() %>%
  adorn_rounding(2)

knitr::kable(tabela_valor, align = "ccc")

# Variáveis possíveis para sua tabela: incluir nos intervalos de classe o limite
# inferior [a,b) em vez do limite superior (a, b], como é o padrão da função cut()

# Podemos definir os intervalos  de classe que desejamos. Por exemplo, se queremos
# os intervalos [12, 182), [182, 352), [352, 522), [522, 692) e [692, 862).
library(janitor)

# Cut para categorizar valor_compra em b intervalos especificados.
intervalo = cut(dados$valor_compra, b=c(12, 182, 352, 522, 692, 862), right = FALSE)

# Tabela de frequência da variável valor_compra
tabela_valor = tabyl(intervalo) %>%
  adorn_totals() %>%
  adorn_rounding(2)

# A tabela de frequência pode facilmente ser inserida no relatório usando:
knitr::kable(tabela_valor, align = "ccc")

#########ESTATÍSTICA DESCRITIVA COM O PACOTE DESCTOOLS
# O pacote DescTools foi desenvolvido com o objetivo de fornecer uma análise 
# descritiva de forma muito rápida e completa, permitindo ao analista ganho de
# tempo nessa tarefa.

# A principal função do pacote Desc que foi concebida para descrever as variáveis
# de acordo com sua natureza, produzindo medidas estatísticas descritivas e uma 
# representação gráfica adequada.

# install.packages("DescTools")
library("DescTools")

# Obtendo estatísticas da base de dados
Desc(dados, digits = 2, plotit = F)

# No caso de variável quantitativa são três gráficos, o histograma sobreposto
# com a curva de desindade estimada; o boxplot e a frequencia acumulada para 
# cada intervalo da variável
plot(Desc(dados$valor_compra), main = "Valor da compra")

# No caso de variável qualitativa, divide-se em:
# Dicotômica (dois níveis) em que o gráfico assemelha-se a um boxplot, porém
# o que se apresenta são intervalos de confiança de 90,95 a 99% para a proporção
# do nível de maior frequencia.
plot(Desc(dados$quinzena), main = "Quinzena",  
 col = colorRampPalette(c("gray10", "gray25", "gray50", "gray75", "gray90"))( 7 ))

# Politômica (mais de dois níveis) em que o gráfico é o de barras tanto para a 
# frequência absoluta como para a relativa (e acumulada em cinza claro)
plot(Desc(dados$filial), main = "Filial", col = colorRampPalette(c("gray10", 
    "gray90")) ( 1 ))
    
################## DADOS FALTANTES
# Vamos analisar uma base de dados com observações faltantes. A primeira 
# pergunta que devemos fazer é: como estão distribuídos os dados faltantes?
dados1 = read.csv2(file="dataset/vendas_NA.csv")

require(DescTools)
PlotMiss(dados1, col = colorRampPalette(c("gray10", "gray90")) ( 1 ))

# Função PlotMiss() => Analisa a distribuição dos dados faltantes, identificando
# quais variáveis apresentam o maior número de dados faltantes, no caso "N_Itens"

# A partir da análise dos dados, o analista deve tomar a decisão entre realizar
# a limpeza dos dados faltantes ou aplicar um algoritmo de imputação para esses
# dados.
require(mice)
require(DescTools)

# Complementando os dados faltantes
dt_ajustado=complete(mice(dados1, printFlag = F ))


# Análise descritiva
Desc(dt_ajustado$n_itens, digits = 2)

###### ANALISANDO DATAS COM O PACOTE DESCTOOLS
# Para fazer análise de datas com R, utilizamos o formato ano, mês e dia. Na
# base de dados o formato é dia, mês e ano (dmy), assim, com o auxílio da função
# dmy do pacote lubridate, fazemos a devida conversão para procedermos com a 
# análise dessa variável.
require(lubridate)

# Transformando a coluna dados$data no formato data ano, mês e dia
x = dmy(as.character(dados1$data))
x

# Analisando a variável data
Desc(x, plotit = F)

# Possível incluir na análise a visualização dos dados em gráfico, bastas omitir
# o argumento "plotit = F
require(DescTools)

# Análise descritiva com gráficos
Desc(x, plotit = T)
