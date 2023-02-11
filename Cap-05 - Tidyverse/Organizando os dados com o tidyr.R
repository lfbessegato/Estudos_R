# Esse pacote auxiliará a organização dos dados que levam em conta as seguintes
# propriedades:

# *** Cada coluna é uma variável;
# *** Cada linha é uma observação;

# O tidyr fornece grupos de funções que permitem organizar os seus dados de 
# forma muito prática. Algumas funções aqui abordadas desse pacote podem não 
# estar disponíveis na versão CRAN, pois foram implementadas recentemente, então 
# sugerimos que seja instalada a versão mais recente do "GitHub".

# Comando para instalar a versão do CRAN
install.packages("tidyr")

# install.packages("devtools")

# Comando para instalar a versão do GitHub
# devtools::install_github("tidyverse/tidyr")

# pivot_longer() e pivot_wider() => Converte os dados em tabelas longas ou 
#     Tabelas largas. Essas funções foram implementadas no ano de 2019 em 
#     substituição ás funções gather() e spread()

# separate() e unite() => Divide e combina colunas de caracteres.

# complete(), drop_na() e replace_na() => Lida com valores ausentes.

# É possível converter várias colunas do dataframe original em duas colunas, uma 
# recebe os nomes das variáveis em colunas e a outra recebe os valores dessas 
# variáveis, ao final o número de linhas do dataframe é ampliado. Essas colunas
# originais devem ter em comum a mesma variável. É como organizar amostras 
# pareadas em que cada nível de medição será organizado por linhas e não por 
# colunas.

#                                                 

