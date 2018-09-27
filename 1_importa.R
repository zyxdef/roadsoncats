# script de importação de dados

library(tidyverse)

# uma aba para cada espécie -- exceto a última aba, que contém metadados
abas <-
  readxl::excel_sheets("dados/Data_species.xlsx") %>%
  head(-1)

# fase de teste: analisar só os dados de Leopardus colocolo,
#   pois faltam as coordenadas nas outras abas
dados <- readxl::read_xlsx("dados/Data_species.xlsx", sheet = "Leopardus_colocolo")

# # quando tiver em mãos a versão do arquivo .xlsx com as coordenadas em todas as abas
# dados <- list()
# for (aba in abas) {
#   dados[[aba]] <-
#     readxl::read_xlsx("dados/Data_species.xlsx", sheet = aba)
#    etc
# }




