# Para transformar uma tabela de dados para o formato longo são necessárias pelo
# menos duas colunas contendo os nomes das categorias de uma variável separados
# por colunas.

# Vamos reorganizar os dados sobre o número de chegadas de turistas em três 
# Estados, criando uma coluna "meio" que especificará o meio de transporte e uma
# coluna "chegadas" que especificará o número de chegadas de turistas.

# Considere dois tipos de meio de transporte, aéreo ou terrestre, em que se 
# observa o número de chegadas de turistas em cada meio. Se armazenando as 
# chegadas para o meio aéreo e outra armazenando as chegadas para o meio
# terrestre, podemos reorganizar nossa tabela de dados em duas colunas, uma 
# coluna para o meio de transporte e outra para o número de chegadas.

library(magrittr)
library(tidyr)

# A tabela inicial de dados
dadostur = data.frame(
  estado = c("SP", "RS", "RJ"),
  terrestre = c(3900, 2800, 2600),
  aereo = c(4200, 3800, 3950)
)
dadostur

# Reorganizando a tabela para o formato longo
dadostur %>%
  pivot_longer(cols=c(terrestre, aereo), names_to = "meio", values_to = "chegada")

# O mesmo procedimento utilizando a função gather
dadostur %>%
  gather(meio, chegadas, terrestre:aereo)

# Observamos => Nesse exemplo que a variável meio recebeu as categorias 
# terrestre e aéreo, que eram variáveis da tabela original e a variável chegada
# recebeu os valores das variáveis iniciais terrestre e aéreo.
# Veja que o dataframe original possui três linhas e o novo ficou com 6 linhas.
# Neste caso particular o número de colunas não se alterou.

# No próximo exemplo uma dieta foi aplicada em amostra de cinco pessoas. O peso
# das pessoas  foi armazenado em dois vetores: antes e depois

# A tabela inicial de dados

dadosdieta = data.frame(
  paciente = 1:5,
  antes = c(150, 160, 90, 95, 110),
  depois = c(140, 110, 80, 80, 82),
  tempo = c(4, 4, 3, 3, 6),
  sexo = c("homem", "homem", "mulher", "mulher", "mulher")
)
dadosdieta

# Reorganizando os dados de forma que dieta receba as categorias antes e depois
# dessas categorias sejam atribuídos ao vetor peso na nova tabela de dados
library(magrittr)
library(tidyr)

# Reorganizando a tabela para o formato longo
dadosdieta %>%
  pivot_longer(cols = c(antes, depois), names_to = "dieta", values_to = "peso")

# O mesmo procedimento utilizando a função gather
dadosdieta %>%
  gather(dieta, peso, antes:depois)

# A função pivot_wider ou spread faz o inverso de pivot_longer ou gather, ou 
# seja, espalha os dados das linhas por colunas.

# Considere os dados organizados do seguinte modo:
dados_longo =
  dadosdieta %>%
  pivot_longer(cols = c(antes, depois), names_to = "dieta", values_to = "peso")
dados_longo

# Partindo da tabela dados_longo, aplicamos a função pivot_wider ou spread para
# distribuir as categorias da variável dieta em colunas cujos valores recebem os
# dados do vetor peso correspondente.

# Reorganizando a tabela para o formato largo

dados_longo %>% pivot_wider(names_from = "dieta", values_from = "peso")

# O mesmo procedimento utilizando a função spread
dados_longo %>% spread(dieta, peso)
