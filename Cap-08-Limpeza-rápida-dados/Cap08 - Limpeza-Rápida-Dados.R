# OBJETIVO => Neste capítulo aprenderemos a limpar os dados antes de iniciar 
# a análise. Apresentar os dados em tabulação cruzada e aplicar o teste qui-
# quadrado em tabelas cruzadas. Ao final, estaremos aptos a utilizar o pacote
# janitor para limpeza rápida dos dados e obter tabulações cruzadas das variáveis

# Para uma limpeza rápida e básica, utilize o pacote janitor que foi projetado 
# para inspeção e limpeza dos dados "sujos". Inicie instalando o pacote com o 
# comando - install.packages("janitor").

# Ele trata vários problemas que podemos encontrar ao utilizar dados abertos ou 
# quando várias pessoas diferentes digitaram os dados, produzindo registros que 
# necessitam de ajustes antes de sua análise.


################# LIMPANDO NOMES DO DATAFRAME
# clean_names () => Para manipular nomes problemáticos de variáveis.
# * Retorna nomes somente com letras em caixa baixa e com _ como separador;
# * Manipula caracteres especiais e espaços;
# * Inclui números para nomes duplicados;
# * Converte o símbolo % para percent preservando o sentido.

# Exemplo 1 - Janitor
#install.packages("janitor")
library(janitor)

# Criando um dataframe com nomes problemáticos
dfp <- as.data.frame(matrix(ncol = 6))
names(dfp) <- c("OriGem", 
                "REPETE", 
                "REPETE", 
                "% de acertos", 
                "R!$@$&*", "")
dfp

# Limpando o dataframe com o pacote janitor
clean_names((dfp))

# Limpando o dataframe com o pacote básico (não recomendável)
make.names(names(dfp))


################# REMOVA COLUNAS OU LINHAS INÚTEIS
# Vamos limpar as colunas com valores constantes e eliminar as linhas vazias, 
# utilizando os comandos remove_constant e remove_empty

library(janitor)

# Tabela de dados com valores perdidos e repetidos
x <- c("b", "a", "b", "c", "c", NA, "a", "a", NA, "a")
y <- rep("Brasil", 10)
z <- c(NA, 1:7, NA, NA)
vazia <- rep(NA, 10)

dt <- data.frame(x, y, z, vazia)
dt

# Vamos limpar o que não serve para a nossa análise, como a coluna y e vazia que
# apresentam valores repetidos e depois eliminar os valores faltantes.
library(janitor)

dt_clean1 = remove_constant(dt)
dt_clean1

# Eliminando as linhas vazias
dt_clean2 = remove_empty(dt_clean1)
dt_clean2


########################## SUBSTITUA VALORES PERDIDOS
# O pacote janitor nos auxilia a eliminar as linhas e colunas com valores
# perdidos, entretanto se o analista necessita substituir tais valores, o pacote
# mice ajuda na tarefa, usando técnicas de imputação de valores que levam em conta
# o tipo de variável, produzindo a substituição dos valores perdidos.

# Considerando os dados com limpeza prévia
summary(dt_clean2)

#install.packages("mice")
library(mice)

# dt_ajustado<-complete(mice(dt_clean2))

# summary(dt_ajustado)



################ PRODUZINDO TABELAS DE FREQUENCIA PARA UMA VARIAVEL
# A função tabyl() do janitor => É uma versão melhorada de table() do pacote base.

# As diferenças são: 
# * Retorna um dataframe que pode ser melhorado e impresso com knitr::kable();
# * Calcula porcentagens automaticamente;
# * Pode exibir valores os valores NA;
# * Quando NA ocorre, uma coluna adicional valid_percent é adicionada;
# * Pode ordenar as contagens;
# * Pode ser usada com o operador pipe %>%
# * Quando a variável for do tipo categórica, os valores perdidos são contabilizados
#   na tabela.

library(janitor)

# Tabela de dados com valores perdidos e repetidos
x <- c("b", "a", "b", "c", "c", NA, "a", "a", NA, "a")
y <- rep("Brasil", 10)
z <- c(NA, 1:7, NA, NA)
vazia <- rep(NA, 10)

# Tabela de frequencia da variável x
tabyl(x, sort = TRUE)

# Podemos usar o operador pipe em conjunto
library(janitor)

tabyl(x) %>%
  dplyr::select(x, valid_percent)

################# TABULAÇÃO CRUZADA
# Uma tabela cruzada é gerada com a função tably() que apresenta as seguintes 
# propriedades:

# * Retorna um dataframe;
# * Calcula frequência absolutas, mas é possível incluir frequências relativas
#   por linha ou coluna;
# * Pode (opcionalmente) mostrar os valores NA.

# A função tabyl do pacote janitor produz o resultado que só seria possível 
# através de um conjunto de várias funções do pacote tidyverse.

# Criando uma tabela 
cor_selec = c("azul", "preto", "azul", "vermelho", "preto", 
              "vermelho", NA, "preto", "vermelho", "preto", "azul")

categoria = c("A", "B", NA, "C", "A", "A", "C", NA, "B", "B", "A")

dt = data.frame(x=cor_selec, y=categoria)
dt


tabyl(dt, x, y)

# O pacote janitor tem um conjunto de funções para adornar a tabulação. São elas:

# * adorn_total => Adiciona o total por linha, por coluna ou por ambos.
# * adorn_percentage => Calcula porcentagem com base nos totais de linha, coluna,
#   ou sobre o total geral da tabela.
# * adorn_pct_formatting => Formata as porcentagens, controlando o número de
#   dígitos a serem exibidos e incluindo o símbolo de %.
# * adorn_rounding => Produz arrendondamento nos números da tabela, não deve ser 
#   usado em conjunto com 'adorn_pct_formatting'.
# * adorn_ns => Adiciona as contagens (frequência absoluta).
# * adorn_title => Adiciona título à tabela, podendo ser no topo da tabela ou 
#   combinado na primeira linha/coluna.

library(janitor)
# Tabulação cruzada entre x e y com adornos.
tabyl(dt, x, y) %>%
  adorn_percentages("row") %>% # Inclui a porcentagem com base na linha.
  adorn_pct_formatting() # formata para %

library(janitor)
# Tabulação cruzada entre x e y com adornos
tabyl(dt, x, y) %>%
  adorn_percentages("col") %>% # Inclui a porcentagem com base na coluna
  adorn_pct_formatting() # formata para %

library(janitor)
# Tabulação cruzada entre x e y com adornos
tabyl(dt, x, y) %>%
  adorn_percentages("all") %>% # inclui  a porcentagem com base no total geral
  adorn_pct_formatting() # formata para %

library(janitor)
# Tabulação cruzada entre x e y com adornos
tabyl(dt, x, y, show_na = F) %>%
  adorn_percentages("all") %>% # Inclui a porcentagem com base no total geral
  adorn_rounding(2) %>% # Arredonda com 2 casas decimais
  adorn_ns() %>% #Inclui as contagens
  adorn_title("combined", row_name = "Cor do Selo", col_name = "Categoria")

########### TESTE QUI-QUADRADO PARA TABELA CRUZADA
# O teste qui-quadrado é um teste não paramétrico e pode ser aplicado em dados 
# tabelados de forma cruzada com o objetivo de testar as seguintes hipóteses 
# estatísticas:

# * H0 => A variável linha é independente da variável coluna, ou seja, a pro-
# porção no total das linhas deve ser a mesma quando considerada em cada cate-
# goria da variável linha.

# H1 => A variável linha é dependente da variável coluna, ou seja, a proporção
# no total das linhas é diferente da proporção em cada categoria da variável 
# linha.

require(janitor)
#Suponha dois grupos que receberam tratamento
grupo = c(rep("A", 15), rep("B", 15))
set.seed(20)

resposta = c(sample(0:1, 16, replace = T), rep(1,14))

dt = data.frame(grupo, resposta)
tab = tabyl(dt, grupo, resposta, show_na = F)
tab

# Aplicando o teste
chisq.test(tab)

# No exemplo seguinte vamos observar a não rejeição da hipótese nula.
require(janitor)

# Suponha dois grupos que receberam tratamento
grupo = c(rep("A", 15), rep("B", 15))
set.seed(20)

resposta = c(sample(0:1, 25, replace = T), rep(1,5))
dt = data.frame(grupo, resposta)

tab1 = tabyl(dt, grupo, resposta, show_na = F)
tab1

# Aplicando o teste
chisq.test((tab1))


########### CAÇA AOS REGISTROS COM VALORES DUPLICADOS
# A função get_dupes() realiza essa tarefa de forma a retornar os registros 
# duplicados do conjunto de dados em análise (exibe uma coluna com a contagem 
# de duplicatas) para que possa detectar os casos problemáticos.
df = data.frame(ID = c(1000, 1001, 1000, 1002),
                FAT = c(2098.60, 345.00, 2098.60, 1332.44),
                ANO = c(2016, 2016, 2016, 2017))

get_dupes(df, ID, FAT)

# Se carregou um arquivo do Excel que deveria ser data, mas aparece como um 
# número, converta-o usando o excel_numeric_to_date().

excel_numeric_to_date(51503)
excel_numeric_to_date(51503, date_system = "mac pre-2011")

################# CONTE OS NÍVEIS DOS FATORES ESCALA DE LIKERT
# A escala de Likert é utilizada para mensurar sentimentos numa escala que pode
# variar entre um e cinco níveis (a mais usada), sendo um o menor nível e cinco
# o maior nível de concordância ou discordância sobre uma pergunta ou afirmação.

f <- factor(c("neutro", "concordo totalmente", 
              "concordo parcialmente", "concordo", 
              "discordo parcialmente", "discordo totalmente", 
              "concordo totalmente", "concordo", 
              "concordo"), 
            levels = c("concordo totalmente",
                       "concordo parcialmente", 
                       "neutro", 
                       "discordo parcialmente", 
                       "discordo totalmente"))
top_levels(f, n = 1)

top_levels(f, n = 2)

# Podemos também utilizar o pacote likert para obter um resumo e uma visualização
# da análise de respostas na escala de Likert.

# Criando uma base de dados simulando com 3 questões 
niveis = c("concordo totalmente",
           "concordo parcialmente", 
           "neutro",
           "discordo parcialmente", 
           "discordo totalmente")
set.seed(30); q1 = factor(sample(1:5, 40, replace = T))
levels(q1) = niveis

set.seed(31); q2 = factor(sample(1:5, 40, replace = T))
levels(q2) = niveis

set.seed(32); q3 = factor(sample(1:5, 40, replace = T))
levels(q3) = niveis

# As respostas na escala de Likert
respostas = data.frame(q1, q2, q3)

# Resumo das respostas
# install.packages("likert")
require(likert)

tb_likert <- likert(respostas)
summary(tb_likert)

require(likert)
library(RColorBrewer)

# Gráfico das respostas em escala de Likert
plot(tb_likert, 
     colors=c("gray30", "gray65", "gray95", "gray75", "gray55"))
