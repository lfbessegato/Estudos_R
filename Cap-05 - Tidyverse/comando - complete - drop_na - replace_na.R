# Podemos completar valores faltantes da nossa tabela de dados em diversas 
# situações em que haja falta de combinações de casos na tabela.
# Suponha que nos dados da dieta queremos todas as combinações em envolvam 
# sexo e tempo.

library(magrittr)
library(tidyr)

# A tabela inicial de dados 
dadosdieta = data.frame(
  paciente = 1:5,
  antes = c(150, 160, 90, 95, 110),
  depois = c(140, 110, 80, 80, 82),
  tempo = c(4, 4, 3, 3, 6),
  sexo = c("homem", "homem", "mulher", "mulher", "mulher")
)
dadosdieta

# Completando as combinações de tempo e sexo
dadosdieta %>%
  complete(sexo, nesting(tempo))

# Observe => Que ao completar os casos para tempo e sexo identificamos a 
#           ausência de pacientes homem com tempo 3 e 6, e mulher com tempo 4

# Para eliminar as linhas que contem valores ausentes (NA), usamos a função 
# drop_na ou podemos substituir os NA's por valores com a função replace_na
dados = dadosdieta %>% 
  complete(sexo, nesting(tempo))
dados

# Eliminando as linhas com NA com base em todas em todas as colunas ou 
# considerando alumas colunas
dados %>% drop_na()

dados %>% drop_na(c(sexo, tempo))

# Substituindo NA nas colunas especificadas
dados %>% 
  replace_na(list(paciente = "ausente", antes = 0, depois = 0))

# Substituindo NA das colunas antes e depois
dados %>% 
  replace_na(list(antes = 0, depois = 0))

# Observe => Quando aplicamos a função drop_na() foram eliminadas todas as 
# linhas que apresentavam algum NA. Ao especificar as colunas sexo e tempo 
# nenhum NA foi eliminado, pois essas colunas não apresentam valor ausente.

# Ao aplicar a função replace_na(), podemos escolher tanto a coluna a ser 
# aplicada como também definir o valor de substituição. Note qie quando 
# definimos em paciente com NA o valor ausente, modificou-se a natureza da 
# variável de inteira para caractere