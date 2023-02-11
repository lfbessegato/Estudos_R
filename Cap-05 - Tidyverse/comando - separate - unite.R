# Suponha que você aplicou um questionário e que uma determinada pergunta tinha
# mais de uma opção como resposta. Precisa organizar a tabela de modo a separar
# as respostas que estão em uma única coluna para diversas colunas.

library(magrittr)
library(tidyr)

# A tabela inicial de dados
respostas = data.frame(ordem=1:6,
                       cor=c("azul, amarelo", "verde, cinza", "azul, verde", 
                             "azul, cinza", "branco, preto", "verde, cinza"))
respostas

# Vamos separar as respostas da coluna cor em duas colunas que denomiraremos de 
# cor1 e cor2. Note que o separador para a resposta cor é virgula.

# Separando as respostas da cor
resposta_sep = respostas %>% 
  separate(cor, c("cor1", "cor2"), sep=",")
resposta_sep

# O comando unite é utilizado para unir duas ou mais colunas Unindo cor1 e cor2
# em uma coluna cor.

# Unindo as respostas sobre cores
resposta_uni = resposta_sep%>%
  unite("cor", c("cor1", "cor2"), sep=",")
resposta_uni
