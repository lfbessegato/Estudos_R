install.packages(c("Rmarkdown", "knitr", "data.table", "tidyverse"), dependencies = TRUE)

# Instalação do Pacote tidyverse
install.packages("tidyverse")

# Instalação do Pacote Janitor
install.packages("janitor")

# Instalação do Pacote rmarkdown
install.packages("rmarkdown")

# Instalação do Pacote devtools
install.packages("devtools")

# Instalação do tidyverse/readr pelo github
devtools::install_github("tidyverse/readr")

# Carregar o ggplot2 - das duas maneiras
require(ggplot2)
library(ggplot2)

# Carregar o tidyverse pelo require
require("tidyverse")

# Consultar a documentação do pacote dyplyr
help(package="dplyr")

# Consultar documentação do pacote base
help(package="base")

# Executar o R online
matriz=rbind(x=1:5, x2=(1:5)^2, x3=(1:5)^3);matriz
