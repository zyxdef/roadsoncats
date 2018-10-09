# script de importação de dados

# carregando os pacotes que serão utilizados
library(magrittr)
library(tidyverse)

# uma aba para cada espécie
abas <- readxl::excel_sheets("dados/Data_species.xlsx")

# carregando os conjuntos de dados de cada espécie (um por aba)
dados <-
  sapply(
    abas,
    function(aba)
      readxl::read_xlsx("dados/Data_species.xlsx", sheet = aba),
    simplify = F,
    USE.NAMES = T
  )

# as variáveis estão com os mesmos nomes em todas as abas?
dados %>%
  lapply(names) %>%
  as.data.frame(stringsAsFactors = F) %>%
  t() %>%
  as.data.frame() %>%
  summarise_all(nlevels)
# só a presença/ausência por espécie (17a) é que não
# está com o nome de cada espécie em cada planilha

# juntando todas os conjuntos de dados em um conjunto de dados único
todos <-
  lapply(
    abas,
    function(aba)
      dados[[aba]] %>%
      rename_all(stringr::str_to_title) %>%
      rename_at(vars(ends_with("_P_A")), funs((function(x) "Presence"))) %>%
      mutate(Species = aba)
  ) %>%
  bind_rows()

# salvando os objetos criados
saveRDS(dados, "dados.RDS")
saveRDS(todos, "todos.RDS")

