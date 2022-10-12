####################### VETORES #####################

# Cria um vetor com 3 numeros
c(7, 4, 1)

# Cria um vetor com 3 nomes (vetor de caracteres)
c("sete", "quatro", "um")

# Cria uma sequencia de numeros inteiros entre 5 e 35
5:35

# Nota de 3 avaliacoes do aluno 1 armazenamento no objeto Nota.aluno1
Nota.aluno1 = c(8, 8.6, 8.8)

# Nota de 3 avaliacoes do aluno 1 armazenamento no objeto Nota.aluno2
Nota.aluno2 = c(7.3, 6.7, 7)

# Consultando o conteúdo do objeto Nota.aluno1
Nota.aluno1

# Consultando o conteúdo do objeto Nota.aluno2
Nota.aluno2


################## TABELA DE DADOS #####################
# Criamos uma tabela de nome notas contendo 
# as notas dos dois alunos em cada coluna
notas = data.frame(Nota.aluno1, Nota.aluno2)

# Consultando o conteúdo do objetos
notas

# Pode ser consultado também
View(notas)

# Criamos um vetor Tipo com as referencias das linhas
Tipo = c("Prova A", "Prova B", "Prova C")

# Acrescenta o vetor Tipo ao objeto notas
notas = data.frame(notas, Tipo)
notas

################# MATRIZES #####################
# Cria uma matriz por colunas
Mc = cbind(Nota.aluno1, Nota.aluno2)
Mc

# Cria uma matriz por Linhas
Ml = rbind(Nota.aluno1, Nota.aluno2)
Ml

# Cria uma matriz por colunas misturando vetor numérico com caractere
M = cbind(Nota.aluno1, Nota.aluno2, Tipo)
M

# Analisando a estrutura do objeto M
str(M)

########### ACESSANDO VALORES DE POSIÇẼS ESPECÍFICAS DOS OBJETOS #############
# Nota do aluno1 na posição 2 do vetor
Nota.aluno1[2]

# Valor armazenado na posição 2 do objeto Tipo
Tipo[2]

# Valor da linha 1 e coluna 2 da matriz Mc
Mc[1,2]

# Valor da linha 2 e coluna 3 da matriz Mc
Ml[2,3]

# Todos os valores da coluna 2
notas[,2]

# Todos os valores da linha 2
notas[2,]

# Valores do vetor Nota.aluno2 contido no objeto notas
notas$Nota.aluno2
