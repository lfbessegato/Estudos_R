# OBJETIVO => Nesse capítulo, conduziremos ao universo da elaboração de gráficos
# e aprenderemos a elaborar gráficos com o pacote básico como também com o paco-
# te ggplot2. Ao final, estaremos apto a elaborar gráficos de barra, circulares
# linhas, dispersão, boxplot, histogramas, dentre outros.

# O primeiro passo para uma visualização dos dados, é identificar quais
# variáveis são categóricas e quais são numéricas. Isso ajudará a escolher a 
# melhor forma de representar graficamente os dados.

# O próximo passo são os processos de construção, ajustes e refinamento até 
# obter o gráfico ideal. O trabalho de elaboração passa por ajustes na escala, 
# nas cores, no tamanho da fontes, dentre outros.

# Planilhas de dados no formato csv são muito fáceis para se ler no R, sem 
# necessidade de instalar qualquer pacote especial


# Lendo Arquivos 
# Acessar via readr, através read_csv2
dados = read.csv2(file="dataset/turismo.csv", sep=",")

# Visualizando as 6 primeiras linhas da tabela
head(dados)

### Gráficos com o pacote básico
# Há muitas possibilidades de produção de gráficos com o pacote básico do R.

# Principais funções para a criação de gráficos
# Função
# barplot(x)        => Produz um gráfico de colunas do vetor x
# boxplot(x)        => Produz o boxplot de x
# coplot(y~x|z)     => Produz um gráfico de dispersão entre x e y condic. a z
# curve(expressão)  => Produz um gráfico a partir da expressão de certa função x
# dotplot(x)        => Produz um gráfico de pontos
# hist(x)           => Produz um histograma do vetor x
# mosaicplot        => Produz um mosaico para tabelas de contingencias
# pairs(x)          => Produz uma grade de gráficos de dispersão entre variáveis
#                      quantitativas de uma tabela
# pie(x)            => Produz um gráfico circular (pizza)
# plot(x)           => Produz um gráfico de dispersão entre x e y
# qqnorm(x)         => Plota os quantis de x usando como base a curva normal
# stem(x)           => Produz um ramo e folhas
# stripchart(x)     => Produz um gráfico de dispersão unidimensional

### Para elaborar um gráfico com título, mudar o estilo e cor dos pontos, basta
# adicionar alguns argumentos dentro da própria função de criação do gráfico.
# Abaixo são exibidos alguns argumentos de funções gráficas para esse tipo de 
# formatação. A maioria dos efeitos que podem ser adicionados aos diversos tipos
# de gráficos são obtidos através desses argumentos.

# Função                      Efeitos do gráfico
# adj=                => Controla a formatação do texto (0-> formatação á 
#                        esquerda; 0.5 -> centralizada, e 1-> á direita)
# main="              => Adiciona título principal ao gráfico de acordo com 
#                        texto entre aspas)
# col=                => Comando para colorir diversos itens do gráfico,pode ser
#                        valores como 1, 2..., ou por nome como 'red', 'blue',
#                        (consulte nomes com o comando colors() ou sistemas como
#                        rgb(), hsv(), gray() e rainbow().Para cor das fontes 
#                        use: coLaxis, coLlab, coLmain, coLsub)
# border=             => Controla a cor da borda de uma coluna no gráfico
# font=               => Controla o estilo da fonte de: 0->normal, 1->itálico, 
#                        2->negrito, 3->itálico e negrito
# cex=                => Controla o tamanho da fonte de textos, o valor padrão é
#                        1.(cex.axis, cex.lab, cex.main, cex.sub)
# ity                 => Especifica o tipo de linha(1->sólida, 2->tracejadas)
# lwd=                => Especifica a espessura da linha (1,2, ...)
# pch=                => Controla o tipo de símbolo(1 a 25 ou especificado entre
#                        aspas)
# type=               => Especifica o tipo de plotagem: 'p'(pontos); 'l'(linhas)
#                        'b'(pontos conectados por linhas), 'o'(idem a B com 
#                        pontos sobrepostos á linha), 'h'(linhas verticais), 
#                        's'(degrau no qual o dado é representado no topo da 
#                        linha vertical), 'S'(idem ao s porém o dados é repre-
#                        sentado na base da linha vertical)
# xlim=(inicio,fim)   => Controla os limites do eixo x
# ylim=(inicio,fim)   => Controla os limites do eixo y
# xlab="              => Adiciona rótulo para o eixo X de acordo com o texto 
#                        entre aspas
# ylab="              => Adiciona rótulo para o eixo Y de acordo com o texto 
#                        entre aspas
# las="               => Controla a orientação dos rótulos dos eixos
#                        0->paralelo ao eixo, 1->horizontal, 2->perpendicular,
#                        3->vertical
# xaxt ou yaxt="      => Se xaxt='n', o eixo x é definido porém não é desenhado
#                        se yaxt='n', o eixo y é definido porém não é desenhado
# text(x,y,'texto,cex,=> Adiciona texto ao gráfico na coordenada(x,y) podendo 
# col)                   ser diminuido o tamanho da fonte na  proporção dese-
#                        jada em relação ao tamanho padrão 1 e com a cor especi-
#                        ficada
# legend(x,y,legenda) => Adiciona uma legenda no ponto(x,y) com os símbolos
#                        dados no campo legenda
# locator(n,type='n'.)=> Retorna as coordenadas correspondentes pedidas pelo 
#                        usuário ao clicar (n vezes) no gráfico.Também desenha
#                        símbolos (type='p') ou linhas(type='1')respeitando os 
#                        parâmetros do gráfico.Por padrão type='n'
# segments(x0,y0,x1,y1)=> Desenha segmentos de linha a partir do ponto (x0, y0) 
#                         até (x1,y1)

### Use o comando par(mfrow=c(i,j)) que prepara uma janela gráfica pronta para 
# receber gráfico em i linhas e em j colunas. Assim se desejamos criar:
# > Dois gráficos  lado a lado devemos fazer par(mfrow=c(1,2));
# > Dois gráficos um abaixo do outro devemos fazer par(mfrow=c(2,1));
# > Quatro gráficos sendo dois em cada linha fazemos par(mfrow=c(2,2));
# > Se omitirmos esse comando será criado um único gráfico na janela gráfica;
# > Outros parâmetros podem ser definidos em par();
# > par(mar=c(5,4,4,2)) é o padrão do R para definir o número de linhas a partir
#   das margens da janela gráfica na ordem: abaixo, esquerda, acima e direita. 
#   Isto impacta no espaço dos títulos do gráfico.Mude esses valores para o 
#   melhor ajuste de seu gráfico;
# > par(mai=c(x1,x2,x3,x4)) define a medida das margens: abaixo, esquerda, acima
#   e direita em polegadas (1 pol = 2.54 cm) a partir das margens da janela 
#   gráfica;
# utilize dev.off() para fechar a janela de devices, isto é, os dispositivos 
# gráficos estabelecidos e retornar para o padrão.

####### GRÁFICO DE BARRAS
# Utilizado para visualizar a frequência de uma variável categórica em forma de
# barras, colocando no eixo x as categorias da variável e no eixo y as 
# frequências.
# É recomendável ordenar as categorias pela frequência produzindo uma visua-
# lização mais funcional, permitindo que se observe rapidamente qual a categoria
# que possui maior frequência.
# É importante que os dados devem estar organizados no formato tabulado, isto é,
# deve-se partir de uma tabela com pelo menos duas colunas: a das categorias 
# (sem repetição) e a das frequências correspondentes.
# Portanto, pode partir de uma tabela já consolidada e a partir dela criar os 
# vetores correspondentes, formando uma tabela de dados ou a partir de um arqui-
# vo de dados e organizá-lo no formato tabulado.

###### script do gráfico de barras
# Tabulando o número de chegadas em cada estado
tabula_Estado = aggregate(cheg_2012 ~Estado, data=dados, sum)
tabula_Estado

# Supondo que os dados foram apresentados consolidados como na tabela, criam-se
# os objetos necessários para elaboração do gráfico de barras.

## script para criar um gráfico de barras - FIGURA 12
# Partindo dos dados tabulados
# As categorias devem estar ordenadas
x = tabula_Estado$Estado[order(tabula_Estado$cheg_2012)]
y = sort(tabula_Estado$cheg_2012) / 1000

# Definindo parâmetros para a janela gráfica
par(mar=c(9, 5, 4, 2), mai=c(1.8, 1, 0.8, 0.4))

barplot(y, names.arg = x, 
        main = "Chegada de turistas ao Brasil em 2012",
        cex.main = 1.5,
        ylab = "Chegadas  por mil", 
        cex.names = 1, 
        axisnames = T, 
        las = 2)

# Fechando o dispositivo gráfico
dev.off()


# Observa-se nesse gráfico que os Estados do Brasil que mais receberam turistas 
# em 2012 foram São Paulo, Rio de Janeiro, Rio Grande do Sul e Paraná, sendo que
# Sendo que São Paulo lidera o ranking e apresenta quase o dobro do número de 
# chegadas ao ser comparado com o segundo colocado que é o Rio de Janeiro.

# Partindo dos dados consolidados
# Criando os objetos, abreviando os nomes dos Estados na mesma ordem da tabela

Est = c("AM", "BA", "CE", "DF", "MS", "MG", "Outros", "PA", "PR", 
        "PE", "RN", "RS", "RJ", "SC", "SP")
Cheg=c(34720, 142803, 91648, 68540, 43891, 54480,
       40749, 16877, 791396, 70259, 40488, 810670, 1164187, 
       195708, 2110427)

### Script para criar um gráfico de barras - FIGURA 13
# Partindo dos dados tabulados
# As categorias devem estar ordenadas

x=Est[order(Cheg)]
y=sort(Cheg)/1000

# Definindo parâmetros para a janela gráfica
par(mar=c(5, 4, 4, 2), mai=c(1, 0.8, 0.8, 0.4))

barplot(y, names.arg = x,
        main = "Chegadas de turistas ao Brasil em 2012", 
        ylab = "Chegadas por mil", 
        xlab = "Estados", 
        cex.main = 1.5,
        cex.names = 1, 
        axisnames = T, # Inclui os nomes das categorias no eixo x
        las = 2
        )
# Na figura é possível observar as categorias dos Estados de froma abreviada. 
# O script que gerou esse gráfico definiu os elementos de cada eixo a partir de
# objetos criados no próprio script.
# O gráfico abaixo exibe os valores de frequência das categorias sobre as barras
# correspondentes.

# Cria o gráfico e armazena em xbar - FIGURA 14
xbar = barplot(y, names.arg = x, 
               main = "Chegada de turistas ao Brasil em 2012", 
               ylab = "Chegadas por mil", 
               xlab = "Estados",
               cex.main = 1.5, 
               cex.names = 0.8, 
               axisnames = T,
               las = 2,
               ylim = c(0, 1.2*max(y)) # Ajuste no eixo y
)

## Adicionando os valores de y no topo de cada barra do xbar
text(xbar, y, label = round(y,2), pos = 3, cex = 0.8, col = "black")

# É possível organizar o gráfico de barras na posição horizontal, conforme a 
# figura abaixo, incluindo o argumento horizon = T no argumento da função
# barplot. Esse recurso pode ser útil quando se tem muitas categorias.

# As categorias devem estar ordenadas - FIGURA 15
x = tabula_Estado$Estado[order(tabula_Estado$cheg_2012)]
y = sort(tabula_Estado$cheg_2012) / 1000

# Definindo parâmetros para a janela gráfica
par (mar = c(6, 8, 4, 2), mai = c(1.2, 1.6, 0.8, 0.4))

barplot (y, names.arg = x, 
         main = "Chegadas de turistas ao Brasil em 20212", 
         xlab = "Chegadas por mil", 
         cex.main = 1.5, 
         cex.names = 1, 
         axisnames = T,
         las = 2, 
         horiz = T)

####### GRÁFICO CIRCULAR - FIGURA 16
# Aplicado para visualizar a frequência de uma variável categórica em forma de
# de círculo. Utilize-o somente em caso de a variável possuir poucas categorias
# (em torno de cinco) e com quantidades diferentes entre si, caso contrário deve
# optar pelo gráfico de barras.

###### script do gráfico circular
# As categorias devem estar ordenadas
x = tabula_Estado$Estado[order(tabula_Estado$cheg_2012)]
y = sort(tabula_Estado$cheg_2012) / 1000

# Observe a proporção de cada categoria
y/sum(y)
x

# Procure juntar categorias com baixa proporção na categoria outros. Aqui
# juntamos as 10 primeiras categorias de menor proporção.
y = c(sum(y[1:10]), y[11:15])
x = c("Outros", as.character(x[11:15]))

# Script para o gráfico circular
porc = 100*round(y/sum(y), 2) # Calcula %
rotulos = paste(x,"(", porc, "%)", sep="") # Texto para os rótulos
par(mar = c(4,0,2,0), mai = c(0.8, 0, 0.4, 0))
pie(y, 
    main="Proporção de chegadas de turistas por Estado em 2012",
    labels = rotulos,
    cex.main=2,
    cex=1.5,
    col=gray(1:length(x)/length(x)))
text(0,-1,"Fonte: Elaborado por pacote graphics version 3.6.1 do R", cex=1)
# No gráfico da figura 16, observamos que São Paulo é o Estado lider que recebeu
# 37% do total de chegadas de turistas ao Brasil no ano de 2012, seguido pelo
# Rio de Janeiro com 21%, Rio Grande do Sul e Paraná com 14% e Santa Catarina
# com 3%. Os demais Estados somam 11% do total.

#### GRÁFICO DE LINHAS - FIGURA 17 
# Utilizado para visualizar duas ou mais variáveis numéricas que podem ser 
# plotadas em função do tempo no eixo x.
# vamos plotar o número de chegadas de turistas do estado de São Paulo ao longo
# dos meses, considerando cada ano observado de 2012 a 2015.

# Organizando os dados do estado de São Paulo em função dos meses
dados_SP = dados[dados$Estado == "SaoPaulo", ]

# Definindo os valores dos eixos
x = dados_SP$Mes
y1 = dados_SP$cheg_2012/1000
y2 = dados_SP$cheg_2013/1000
y3 = dados_SP$cheg_2014/1000
y4 = dados_SP$cheg_2015/1000

# Definindo os limites do eixo y
li = min(y1, y2, y3, y4)
ls = max(y1, y2, y3, y4)

# Script para o Gráfico de linha
plot(x, y1, lty = 1, lwd = 1, type = "b", ylim = c(0.8*li, ls*1.2))
lines(x, y2, lty = 2, lwd = 1, type = "b") # Acrescente y2
lines(x, y3, lty = 3, lwd = 2, type = "b") # Acrescente y3
lines(x, y4, lty = 4, lwd = 1, type = "b") # Acrescente y4
title(main = "Chegada de turistas em São Paulo", 
      xlab = "Mês", 
      ylab = "Chegadas por mil", 
      sub = "Fonte: Elaborado com pacote graphics version 3.6.1 do R.", 
      cex.sub = 0.8)
legend(9,380, c("2012", "2013", "2014", "2015"), lty = 1:4, cex = 1.1)

# O gráfico da figura 17 nos mostra que a série de chegadas no ano de 2014 teve
# um comportamento atípico nos meses de março (queda em relação aos demais anos)
# e junho (aumento em relação aos demais anos). O aumento em 2014 se justifica 
# pelo evento da Copa do Mundo que ocorreu no Brasil entre 12 de junho e 13 de 
# julho, atraindo um número significativo de turistas. Em geral, o comportamento
# das séries em função dos meses sugere o mesmo padrão ao longo dos anos, com
# aumento nos meses de março, julho e dezembro e queda no mês de setembro.

# Versão com aplicação das cores

# Script para gráfico de linhas com aplicação das cores
plot(x, y1, lty = 1, lwd = 1, type = "b", ylim = c(0.8*li, ls*1.2), col="red")
lines(x, y2, lty = 2, lwd = 1, type = "b", col = "yellow")
lines(x, y3, lty = 3, lwd = 2, type = "b", col = "blue")
lines(x, y4, lty = 4, lwd = 1, type = "b", col = "green")
title(main="Chegada de Turistas em São Paulo", 
      xlab = "Mês", 
      ylab = "Chegadas por mil", 
      sub = "Fonte: Elaborado com pacote graphics version 3.6.1 do R", 
      cex.sub = 0.8)
legend(9,380, c("2012", "2013", "2014", "2015"), col = c("red", "yellow", 
                "blue", "green"), lty = 1:4, cex = 1)

# Vamos comparar as séries de São Paulo e Rio de Janeiro utilizando a divisão 
# da janela gráfica em duas partes através do comando par(mfrow)

# Assim como foi feito para São Paulo, será realizado para o Rio de Janeiro:

# Organizando os dados do Estado do Rio de Janeiro em função dos meses
####### GRÁFICO 18

dados_RJ = dados[dados$Estado == "RioJaneiro", ]

# Definindo os valores dos eixos
x1 = dados_RJ$Mes

z1 = dados_RJ$cheg_2012 / 1000
z2 = dados_RJ$cheg_2013 / 1000

z3 = dados_RJ$cheg_2014 / 1000
z4 = dados_RJ$cheg_2015 / 1000

# Script para dois gráficos de linhas
# Preparando a janela para receber dois gráficos

par(mfrow = c(2,1))

# Gráfico 1 
# Definindo os limites do eixo y
li = min(y1, y2, y3, y4)
ls = max(y1, y2, y3, y4)

plot(x, y1, lty = 1, lwd = 1, type = "b", ylim = c(0.8 * li, ls*1.2))
lines(x, y2, lty = 2, lwd = 1, type = "b")
lines(x, y3, lty = 3, lwd = 2, type = "b")
lines(x, y4, lty = 4, lwd = 1, type = "b")
title(main = "Chegada de Turistas em São Paulo", 
      xlab = "Mês ", 
      ylab = "Chegadas por mil")
legend(9,380, c("2012", "2013", "2014", "2015"), lty = 1:4, cex = 0.9)

# Gráfico 2

# Definindo os limites do eixo y
li = min(z1, z2, z3, z4)
ls = max(z1, z2, z3, z4)

plot(x1, z1, lty = 1, lwd = 1, type = "b", ylim = c(0.8*li, ls*1.2))
lines(x1, z2, lty = 2, lwd = 1, type = "b")
lines(x1, z3, lty = 3, lwd = 2, type = "b")
lines(x1, z4, lty = 4, lwd = 1, type = "b")
title(main = "Chegada de Turistas no Rio de Janeiro",
      xlab = "Mês", 
      ylab = "Chegadas por mil", 
      sub = "Fonte: Elaborado com pacote graphics version 3.6.1 do R.",
      cex.sub = 0.8)
legend(9,280, c("2012", "2013", "2014", "2015"), lty = 1:4, cex = 0.9)

# Ao compararmos os dois gráficos relativos aos dois maiores Estados receptores
# de turistas do Brasil, figura 18, vemos que as séries apresentam comportamento
# muito semelhante, com a diferença de que São Paulo apresenta um quantitativo
# maior do que o do Rio de Janeiro.

######## GRÁFICO DE DISPERSÃO
# Utilizado para observar a relação entre duas variáveis quantitativas. 
# O pesquisador ao plotar esse gráfico busca inicialmente por uma relação linear
# A visão do gráfico deve ser acompanhada pela medida do coeficiente de 
# correlação linear que mede matematicamente a intensidade dessa relação. O
# coeficiente de correlação é uma medida que varia entre -1 e 1, espera-se 
# valores próximos de -1 ou de 1 no caso de presença de relacionamento linear.
# Esse relacionamento pode ser crescente (coeficiente positivo) ou decrescente
# (coeficiente negativo).

###### script do gráfico de dispersão
# Observando a correlação entre as chegadas de São Paulo e Rio de Janeiro
x = dados_RJ$cheg_2014/1000
y = dados_SP$cheg_2014/1000

# obtendo a correlação
cor(x, y)

# Obtendo os coeficientes da reta de regressão
lm(y ~x)$coef

plot(x, y,
     main = paste("Gráfico de Dispersão entre as chegadas de turistas de 2014", 
                  "\n", "São Paulo x Rio de Janeiro"),
     xlab = "Chegadas no Rio de Janeiro/1000",
     ylab = "Chegadas em São Paulo/1000")
abline(lm(y ~ x), lty = 2, lwd = 2) # Adiciona a reta tracejada
text(130, 240, "Reta de Regressão") # Adiciona texto na posição (130, 230)
text(130, 220, paste("y = ", eval(expression(round(lm(y~x)$coef[[2]],2))),
                     "x + ",eval(expression(round(lm(y~x)$coef[[1]],2))))) 
# Adiciona equação na posição (130, 230)

# O coeficiente de correlação entre as chegadas de turistas no Rio de Janeiro e 
# e em São Paulo por ser próximo de um, indica uma forte correlação linear 
# positiva. Observamos no gráfico da figura 19 que os pontos estão próximos da 
# reta de regressão, indicando que um aumento na chegada de turistas ao Rio de 
# Janeiro está relacionado a um aumento médio em torno de 1.11 turistas corres-
# pondentes em São Paulo. Podemos dizer que de forma geral no ano de 2014, cada 
# aumento de um turista no Rio de Janeiro representou um aumento médio de 1.11 
# turistas em São Paulo.

############ BOXPLOT E HISTOGRAMA
# São gráficos utilizados para inspecionar visualmente a distribuição de fre-
# quência de variáveis quantitativas. Observa-se nesses gráficos principalmente 
# a simetria e seu desvio, presença de valores discrepantes, também conhecidos 
# como 'outliers', assim como a amplitude da variável.

# No Histograma, observa-se principalmente a forma como a variável numérica se 
# distribui. É muito parecido e confundido com o gráfico de barras, porém o 
# gráfico de barras se aplica a uma variável categórica, é um gráfico de eixo 
# numérico único (eixo x ou y representando a frequência das categorias da 
# variável), enquanto que o histograma diz respeito somente a variáveis numéri-
# cas e possui dois eixos numéricos (eixo x representando a variável e eixo y 
# representando a frequência da variável).

##### Histograma - gráfico 20
# compreendendo a distribuição frequência chegadas de turistas ao Brasil em 2012

x = dados$cheg_2012/1000

hist(x, 
     freq = T, # se T fornece a frequencia absoluta, se F fornece a frequencia
               # relativa.
     main = "Histograma das chegadas de Turitas ao Brasil em 2012",
     xlab = "Chegadas de turistas em 2012 por mil",
     ylab = "Frequência Absoluta das chegadas")

# No histograma da figura 20 observamos uma frequência muito elevada no primeiro
# retângulo, seguido de uma sequência de retângulos de alturas bem menores e 
# muito próximas considerando a escala do gráfico. Esse formato mostra uma 
# distribuição assimétrica à direita que é o sentido da cauda mais longa do 
# gráfico.

# O boxplot exibe medidas estatísticas importantes para a compreensão de
# aspectos como forma e amplitude dos dados. Estas medidas são: o menor/maior
# valor observado, os quartis Q1, Q2 e Q3, o intervalo interquartil 
# (IQR = Q3 - Q1) e os valores discrepantes se houverem.
# Todas essas informações são apresentadas esquematicamente em forma de caixa.

# Ao analisar um boxplot observamos se há a presença de outliers, comparamos as 
# medidas Q2 - Q1 com Q3 - Q2 da seguinte forma:
#->Q3 - Q2 > Q2 - Q1, a posição central dos dados apresenta assimetria à direita
#->Q2 - Q1 > Q3 - Q2, a porção central dos dados apresenta assimetria à esquerda
#->Q2 - Q1 = Q3 - Q2, a porção central dos dadossão simétricos em relação à Q2

############ BOXPLOT - GRÁFICO 21
# compreendendo a distribuição frequência de chegadas de turistas ao Brasil 2012

x = dados$cheg_2012/1000

boxplot(x, 
        main = "Boxplot das chegadas de Turistas ao Brasil em 2012",
        xlab = "Ano de 2012",
        ylab = "Chegadas de turistas em 2012 por mil")

# o boxplot da figura 22 mostra uma grande quantidade de valores discrepantes ou 
# outliers, são meses de 2012 em que se observou mais de 100 mil chegadas. 
# Observamos que o primeiro quartil e o segundo estão próximos considerando a 
# escala do gráfico. Pode-se dizer que o terceiro quartil se aproxima de 50 mil,
# isso significa que aproximadamente 75% do número de chegadas de turistas ao 
# Brasil em 2012 estão abaixo de 50 mil. Vale lembrar que essas observações 
# consideram todos os Estados do Brasil e portanto é de se esperar uma grande
# variabilidade nos dados. A assimetria fica configurada pela comparação entre
# os tamanhos das caixas delimitadas por Q1, Q2 e Q3, classificando-se como 
# assimetria à direita, pois Q2 - Q3 > Q2 - Q1.

############### EXERCÍCIOS DE FIXAÇÃO
# 1) Histograma
hist(dados$cheg_2014/1000, 
     col= "darkblue", 
     main = "Histograma", 
     xlab = "Número de chegadas por mil", 
     ylab = "Frequência", 
     sub = "Fonte: elaboração própria")

# 2) Boxplot:
boxplot(dados$cheg_2014/1000, 
        col = "darkblue", 
        main = "Boxplot", 
        xlab = "Número de chegadasa", 
        sub = "Fonte: elaboração própria")

# 3) Ramo e folhas:
stem(dados$cheg_2014)

# 4) Grade de dispersão
pairs(dados)

# 5) Pizza
# Estados com chegadas em 2014 acima de 150 mil
dt = table(dados$Estado[dados$cheg_2012>150000])
dt = dt[dt>0]

y=dt
x=names(dt)

porc = 100 * round(y/sum(y), 2) # Calcula %
rotulos = paste(x, "(", porc,"%)", sep="") # Texto para os rótulos
par(mar = c(4,0,2,0), mai = c(0.8, 0, 0.4, 0))
pie(y, 
    main = "Estados com chegadas de turistas acima de 150 mil em 2014", 
    labels = "rótulos", 
    cex.main = 2, 
    cex = 1.5, 
    col = gray(1:length(x) / length(x)))

# 6) Dispersão:
plot(dados$cheg_2012, dados$cheg_2013)

# 7) QQnorm:
qqnorm(dados$cheg_2012)

############# GRÁFICOS COM GGPLOT2
# O gráfico feito com o ggplot é construído a partir da camada (layers), cada 
# camada é sobreposta uma após a outra gerando o desenho final. Existem comandos
# específicos para cada camada. 

# install.packages ('ggthemes')
library(ggthemes)
library(ggplot2)

 f = ggplot(dados, aes(cheg_2012/1000, cheg_2013/1000)) + 
   geom_blank() +
   labs(x="", y="")
 
 p1 = f + theme_gdocs(base_size = 18) + ggtitle("theme_gdocs")
 p1

 #### Inserindo título, subtítulo e rótulos aos eixos de um ggplot - FIG. 25
  require (ggplot2)
 
 # Criando o mapeamento dos eixos
 p = ggplot(data = dados, aes(x=cheg_2012/1000, y=cheg_2013/1000))
 
 # Aplicando elementos de texto na forma janela em branco
 p + 
   geom_blank() +
   labs(title="Título", 
        x = "Eixo X", 
        y = "Eixo Y", 
        subtitle = "Subtítulo",
        caption = "Elaborado por ...") +
   theme_bw(base_size = 18)

########### Escalas no ggplot - Fig 26
# Podemos definir a escala dos eixos utilizando uma camada específica para esse
# fim. 
# scale_x_discrete() ou scale_y_discrete()

p = ggplot(data = dados, aes(x=Estado, y = cheg_2012))

p + 
  geom_blank() + 
  labs(title = "Título", 
       x = "Eixo x", 
       y = "Eixo y", 
       subtitle = "Subtítulo", 
       caption = "Elaborado por ...") +
  theme_bw(base_size = 12) +
  scale_x_discrete(limits = c("Amazonas", "Rio de Janeiro"))
  
### Figura 27 - Exibe as categorias do eixo x no topo do gráfico e não na 
# base como é usual.

p = ggplot(data = dados, aes(x=Estado, y = cheg_2012))

p + 
  geom_blank() + 
  labs(title = "Título", 
       x = "Eixo x", 
       y = "Eixo y", 
       subtitle = "Subtitulo", 
       caption = "Elaborado por ...") + 
  theme_bw(base_size = 10) +
  scale_x_discrete(labels = abbreviate, position = "top")

##Figura 28 -> Alterando a escala contínua do gráfico

p = ggplot(data = dados, aes(x = cheg_2012/1000, y = cheg_2013/1000))

p + 
  geom_blank() +
  labs(title = "Título", 
       x = "Eixo x", 
       y = "Eixo y", 
       subtitle = "Subtítulo", 
       caption = "Elaborado por...") +
  theme_bw(base_size = 10) +
  scale_y_continuous(
    breaks = c(75, 150, 225), 
    labels = c("75 mil", "150 mil", "225 mil"),
    position = "right",
    trans = "reverse") +
  scale_x_continuous(limits = c(5, 150))
  
##### Cores nos gráficos ggplot
# As cores podem ser aplicadas em diversos elementos com as linhas do gráfico
# o preenchimento de forma gráfica, assim como as cores do texto. 

# A cor de preenchimento de um gráfico é estabelecida pelo parâmetro fill
# A cor da linha ou contorno do gráfico pode ser definida com o parâmetro
# colour ou color.
# O grau de transparência da cor pode ser ajustado com o parâmetro alpha
# valores (0 e 1).

# Rode este código para obter a paleta com 657 cores e seus respectivos nomes
par(mar=c(0,0,0,0))
plot(0, 0, type = "n", xlim = c(0, 1), ylim = c(0, 1), axes = FALSE, xlab = "", ylab = "")
line<-30
col <- 22
rect(
  rep((0:(col - 1)/col), line),
  sort(rep((0:(line - 1)/line), col), decreasing = T),
  rep((1:col/col), line),
  sort(rep((1:line/line), col), decreasing = T),
  border ="white",
  col = colors()[seq(1, line*col)])
  
  # Nomes das cores
  text(
    rep((0:(col - 1)/col), line) + 0.02,
    sort(rep((0:(line - 1)/line), col), decreasing = T) + 0.015,
    colors()[seq(1, line*col)],
    cex=0.5)
  
  # Adaptado de https://r-graph-gallery.com/42-colors-names.html

# Script  para visualizar as paletas de cores do R básico
show_palette <- function(colors) {
  image(1:n, 1, as.matrix(1:n), col = colors, xlab="", ylab="", xaxt="n", yaxt="n", bty="n")
}

n <- 10 # mude o número de cores a exibir
alpha <- 1 # mude o grau de transparencia (valor entre 0 e 1)

show_palette(rainbow(n, alpha))
show_palette(heat.colors(n, alpha))
show_palette(terrain.colors(n, alpha))
show_palette(topo.colors(n, alpha))
show_palette(cm.colors(n, alpha))


# Script para visualizar as paletas do pacote RColorBrewer
library(RColorBrewer)
display.brewer.all()

# Visualizando a paleta Greys do pacote RColorBrewer
require(RColorBrewer)
display.brewer.pal(n = 10, name='Greys')

# Nomes das paletas do pacote wesanderson
#install.packages('wesanderson')
library(wesanderson)

names(wes_palettes)

# Script para visualizar as paletas do pacote wesanderson
library(wesanderson)

wes_palette("GrandBudapest1", 4, type = "discrete")
wes_palette("GrandBudapest1", 10, type = "continuous")

##### AJUSTANDO PARÂMETRO DE TEXTOS DE UM GGPLOT
# Os temas possuem formatações padronizadas para todos os elementos textuais de 
# um gráfico como título, subtítulo ou rótulos dos eixos. 

# Figura 30 - Explorando elementos textuais
p = ggplot(data = dados, aes(x=cheg_2012/1000, y=cheg_2013/1000))

p + 
  geom_blank() + 
  labs(title = "Título", 
       x = "Eixo x", 
       y = "Eixo y", 
       subtitle = "Subtitulo") +
  theme_bw(base_size = 10) +
  theme(text = element_text(family = "mono")) + # Altera a fonte de todos 
                                                # os textos
  theme(axis.text.x = element_text(size = rel(1.2))) + # Aumenta a fonte do 
                                                       # eixo x em 20%
  theme(axis.text.y = element_text(angle = 45)) + # Muda o ângulo do texto do 
                                                  # eixo y em 45 graus
  theme(axis.title.y= element_text(face="bold.italic")) # Muda o texto do rótulo
                                                       # do eixo x para negrito
                                                       # itálico.
  theme(plot.tile=element_text(hjust = 0.5)) # Centraliza o Título
  theme(plot.subtitle = element_text(hjust = 1)) # Subtítulo à direita
  
######## VÁRIOS GRÁFICOS EM UMA JANELA - Figura 31
# Usar library(grid) ou library(patchwork) em um conjunto com ow gráficos 
# produzidos por ggplot.
  
library(grid)
library(ggplot2)
  
# p definido anteriormente
p = ggplot(data = dados, aes(x=cheg_2012/1000, y=cheg_2013/1000))

# Gráfico 1
g1 = p + 
  geom_blank() +
  theme_bw(base_size = 10)

# Gráfico 2
g2 = p + 
  geom_point() +
  theme_minimal(base_size = 10)

# Layout para 1 linha e duas colunas (g1 ao lado de g2)
pushViewport(viewport(layout = grid.layout(1, 2)))

# Atribuindo g1
print(g1, vp = viewport(layout.pos.row = 1,
                        layout.pos.col = 1))

# Atribuindo g2
print(g2, vp = viewport(layout.pos.row = 1,
                        layout.pos.col = 2))


# Figura 31 -> utilizando o pacthwork
#install.packages('patchwork')
library(patchwork)
library(ggplot2)

# p definido anteriormente

# Gráfico 1 
g1 = p + 
  geom_blank() + 
  theme_bw(base_size = 10)

# Gráfico 2
g2 = p + 
  geom_point() +
  theme_minimal(base_size = 10)

# layout para 1 linha e duas colunas (g1 ao lado de g2)
g1 + g2 + plot_layout(ncol = 2) + 
  plot_annotation(title = "Dois gráficos com patchwork", tag_levels = "1")
# Título Geral e números em cada gráfico

######## GRÁFICO DE BARRAS COM GGPLOT2
# Os dados utilizados para estes gráficos estão disponiveis em 
# https://github.com/Lucianea/Alta/blob/master/turismo.csv

# Lendo Arquivos 
# Acessar via readr, através read_csv2
# dados = read.csv2(file="dataset/turismo.csv", sep=",")

head(dados)
require(ggplot2)
require(magrittr)
require(dplyr)

# Organizando os dados
dt = dados %>%
  group_by(Estado) %>%
  summarise(y = sum(cheg_2013/1000)) %>%
  arrange(y)

head(dt)

# Observe os níveis da variável Estado
levels(dt$Estado)

# Script para o gráfico de barras com ggplot2
require(ggplot2)

p = ggplot(dt) + 
  aes(x = reorder(Estado, y), y) + # Mapeamento das Variáveis
  geom_bar(stat = "identity") + # Forma de Barras
  labs(title = "Chegada de Turistas ao Brasil em 2013", 
       x = "Estados", 
       y = "Número de chegadas por mil") + # Títulos
  geom_text(aes(label = round(y, 2)), hjust = 0, vjust = 0) +
  #Insere valores sobre as barras
  theme_bw(base_size = 8) + # Define o tema
  theme(plot.title = element_text(hjust = 0.5)) + #centraliza o
  # título
  theme(axis.text.x = element_text(angle = 90)) # Muda o ângulo
# do texto do eixo x para 90 graus

p

#### FIGURA 34 - Gráfico de Barras com ggplot2 (lado a lado e empilhado)
require(dplyr)
require(tidyr)

# Organizando os dados em 3 colunas
dt = dados %>%
  filter(Estado == "São Paulo" | Estado == "RioJaneiro") %>%
  rename(`2012` = cheg_2012, `2013` = cheg_2013, `2014` = cheg_2014, `2015` = cheg_2015) %>%
  gather(ano, chegada, `2012`:`2015`) %>%
  select(Estado, ano, chegada) %>%
  group_by(Estado, ano) %>%
  summarize(chegada=sum(chegada)) %>%
  ungroup()

# Convertendo ano para fator
dt$ano = factor(dt$ano)

dt

require(ggplot2)

# Script para gráfico de barras com duas ou mais categorias

p = ggplot(dt) +
  aes(x = reorder(Estado, chegada), y = chegada/1000, fill = ano) + 
  geom_bar(stat="identity", position = "dodge") + 
  geom_text(aes(label=round(chegada/1000, 2)), position = position_dodge(width=0.9), vjust=-0.25)

# Adicionando camadas a p
p1 = p + 
  labs(title = "Chegada de Turistas ao Brasil - versão lado a lado",
      x = "Estados",
      y = "Número de chegadas por mil") +
  theme_bw(base_size = 8) + 
  theme(plot.title = element_text(hjust=0.5)) +
  scale_fill_grey(start = 0, end = .9)
p1

# Criando a versão barras empilhadas
p = ggplot(dt) +
  aes(x = reorder(Estado, chegada), y=chegada/1000, fill=ano) +
  geom_bar(stat = "identity") + 
  geom_text(aes(label=round(chegada/1000, 2)), position = position_stack(vjust = 1))

# Adicionando camadas a p
p2 = p + 
  labs(title = "Chegada de Turistas ao Brasil - versão barras empilhadas",
       x = "Estados",
       y = "Número de chegadas por mil") +
  theme_bw(base_size = 8) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_grey(start = 0.4, end = 1)
p2

require(patchwork)
pp = p1 + p2 + plot_layout(ncol = 1) + plot_annotation(title = "Gráfico de Barras com duas ou mais categorias", tag_levels = 1)
pp

########### BOXPLOT ou HISTOGRAMA COM GGPLOT2 - FIGURA 35
# Para elaborar um boxplot é necessária pelo menos uma variável quantitativa.
# Se a variável pode ser agrupada por fatores, teremos um boxplot comparativo 
# y ~ x, isto é, variável numérica y agrupada pelas categorias da variável do 
# tipo fator x.

# Script para boxplot no ggplot
require (ggplot2)
p = dados %>% 
  ggplot(aes(x = as.factor(Mes), y = cheg_2012/1000))

p + geom_boxplot() +
  labs(x = "Mês",
       y = "No. de chegadas",
       title = "Vizualizando a variabilidade de chegadas de Turistas ao Brasil no ano de 2012") +
  theme_bw(base_size = 9)

####### FIGURA 36 - Caixa Horizontal
p = dados %>%
  ggplot(aes(x = as.factor(Mes), y = cheg_2012/1000))

p + geom_boxplot() +
  labs(x = "Mês", 
       y = "No. de chegadas", 
       title = "Visualizando a variabilidade de chegadas de turistas ao Brasil no ano de 2012") +
  theme_bw(base_size = 9) +
  coord_flip() # Inverte a posição do eixo x

####### FIGURA 37 - boxplot - Caixa Vertical

# Script para histograma no ggplot
require(ggplot2)

p = ggplot(dados, aes(x=cheg_2013/1000))

p + 
  geom_histogram(aes(y = ..count.., fill = factor(Regiao)), 
                 position = "identity", alpha=0.6, binwidth = 0.1) +
  scale_x_log10() +
  labs(x = "Chegada em escala logarítimica", 
       y = "Frequência Absoluta",
       title = "Histograma do número de chegadas de turistas ao Brasil \nAno de 2013") +
  theme_bw(base_size = 9) + 
  scale_fill_discrete(name = "Região") +
  scale_fill_grey(start = 0.2, end = 0.8)


###### EFEITO JITTER - FIGURA 38 - Efeito jitter
# O efeito estabelece uma forma de evidenciar repetições. É um efeito que mostra
# os pontos sobrepostos num resultado de espalhamento em torno do ponto de 
# sobreposição, permitindo que se visualize melhor a quantidade de ocorrências

p = ggplot(dados, aes(x = as.factor(Mes), y = cheg_2012/1000))

p + geom_boxplot() + 
  geom_jitter() + 
  theme_bw(base_size = 9)
labs(x = "Mês", y = "Chegadas de turistas por mil", 
     title = "Efeito Jitter")

###### GRÁFICO CIRCULAR COM GGPLOT2 - FIGURA 41 - GRÁFICO DE SETORES
# Fazer um gráfico circular com ggplot equivale a produzir um gráfico de barras 
# e aplicar coordenadas polar para transformar as barras na forma circular.

require(ggplot2)

# Organizando os dados
d <- data.frame(orcamento = c(10, 20, 30, 40), 
                Empresa = c(paste("E", 1:4)))
d %>% 
  ggplot(aes(x = 1, weight = orcamento, fill = Empresa)) + 
  geom_bar(color="black") +
  coord_polar(theta = "y") + 
  geom_text(x = 1.3, aes(y = cumsum(orcamento[4:1]) - orcamento[4:1] / 2, 
                         label = paste0(100*round(orcamento[4:1] / sum(orcamento[4:1]), 3), "%"))) +
  scale_y_continuous(breaks = NULL) +
  scale_x_continuous(breaks = NULL) +
  labs(x = "", y = "Fatia do orçamento a ser pago", title = "Gráfico com ggplot2") +
  theme_bw(base_size = 9) +
  theme(panel.grid=element_blank()) +
  scale_fill_grey(start=0.6, end=1)

################ GRÁFICO DE PONTOS - FIGURA 42 - Dispersão
# No Gráfico de pontos temos dois eixos numéricos produzindo um gráfico de 
# dispersão. É possível agrupar os pontos por dois grupos, a um atribuímos cores
# distintas e ao outro atribuímos formas distintas.

require(ggplot2)
ggplot(subset(dados, Regiao %in% c("Sul", "Sudeste")), 
       aes(x = Mes, 
           y = cheg_2013/1000, 
           color = Regiao)) +
  scale_x_continuous(limits = c(1, 12), 
                     breaks = seq(1, 12, 1)) +
  geom_point(size = 3) + 
  labs(title = "Gráfico de Dispersão: mês x chegadas em 2013", 
       y = "Chegadas por mil") +
  theme_bw(base_size = 9) +
  scale_color_grey(start = 0.8, end = 0.2)


###### GRÁFICO DE LINHAS - FIGURA 43 - Gráfico de linhas
# No gráfico de linhas temos dois eixos numéricos, produzindo um gráfico em que
# cada ponto dele é unido por uma linha. É um gráfico adequado para representar 
# séries de valores no tempo.

ggplot(subset(dados, Regiao %in% c("Sul", "Sudeste")), 
       aes(x = Mes, 
           y = cheg_2013/1000, 
           color = Regiao, 
           shape = Estado)) +
  scale_x_continuous(limits = c(1, 12), 
                     breaks = seq(1, 12, 1)) +
  geom_point(size = 1.5) +
  geom_line(size = 1.0) +
  labs(title = "Gráfico de Linha: mês x chegadas em 2013", 
       y = "Chegadas por mil") + 
  theme_bw(base_size = 9) +
  scale_color_grey()


######### EFEITO DE SUAVIZAÇÃO SMOOTH - FIGURA 44 - Suavização Smooth
# Trata-se de um ajuste por curva de tendência entre duas variáveis numéricas, 
# utilizando-se de modelo de regressão local para gerar uma curva suavizada que 
# melhor se ajuste aos pontos. Na regressão local, estima-se uma função na 
# vizinhaça de cada ponto de interesse.

ggplot(subset(dados, Estado %in% c("SaoPaulo")), 
       aes(x = cheg_2012/1000, 
           y = cheg_2013/1000, 
           color = Estado)) +
  scale_x_continuous(limits = c(140, 230), 
                     breaks = seq(140, 230, 10))+ 
  geom_point(size = 1.5) +
  geom_smooth(size = 1.0) + 
  labs(title = "Gráfico com ajuste de curva de tendência: 2012 x 2013", 
       y = "Chegada por mil em 2013", 
       x = "Chegada por mil em 2012") +
  theme_bw(base_size = 9) +
  scale_color_grey()


########### GRÁFICO DE DISPERSÃO COM LINHA DE TENDÊNCIA - FIGURA 45
# Considere o modelo teórico Y = 2x + 7. Vamos simular uma amostra de tamanho
# 30 desse modelo. Utilizar a função 'lm' para obter o modelo de regressão linear
# mostrando o resultado no gráfico.

# Organizando os dados
set.seed(240517)
x = runif(30); y = 2 * (x + rnorm(30, 0, 0.1)) + 7
z = rep(c("a", "b"), c(15, 15))
df = data.frame(x, y, z)
model = lm(y ~ z, df)
dfm = data.frame(x, ym = predict(model))

# Script para o gráfico de dispersão
ggplot(df, 
       aes(x, y, color = "")) +
  geom_point() +
  geom_smooth(method = "lm") + 
  labs(title = sprintf("Regressão Linear\nR-quadrado=%1.3f\nEquação:%1.2fX+1.2f",
                       summary(model)$r.squared,
                       summary(model)$coeficients[2],
                       summary(model)$coeficients[1],
                       color = sprintf("Equação: %1.2fX+1.2f",summary(model)$coeficients[2], 
                                       summary(model)$coeficients[1]))) + 
  scale_color_grey() +
  scale_fill_grey() + 
  theme_bw(base_size = 9) +
  theme(plot.title = element_text(hjust = 0.5))
