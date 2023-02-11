# Combinando tabelas de dados
# Tabelas de dados podem ser combinadas gerando outras tabelas. Suponha duas
# tabelas x e y com o mesmo número de linhas ou colunas. Podemos juntar x e y
# lado a lado ou uma sobre a outra formando uma nova tabela.

# Os comandos do tipo join fazem a combinação no nível das colunas e os comandos
# do tipo interception, union e setdiff fazem a combinação no nível das linhas.

# Para verificar a igualdade entre duas base utilize setequal. Mesmo que as 
# linhas estejam em ordem distintas em cada tabela, a função verificará se são
# iguais apesar do ordenamento.

# Os comandos utilizados para fazer essas operações são:
# * bind_cols() ou bind_rows() => Une duas tabelas lado a lado ou sobrepostas
# * inner_join(0) => Une colunas com base na interseção, tudo que coincide nas
# duas bases x e y.
# * left_join() => Une colunas à esquerda, tudo de x que coincide com y.
# * right_join() => Une colunas à direita, tudo de y que coincide com x.
# * full_join() => Une colunas com base na união, tudo de x ou y.
# * intersect() => Retorna as linhas que aparecem em x e y ao mesmo tempo.
# * union() => Retorna as linhas que aparecem em x ou y.
# * setdiff() => Retorna as linhas de x que não aparecem em y.
# * setequal() => Verifica se x e y possuem linhas iguais independentemente da ordem.
