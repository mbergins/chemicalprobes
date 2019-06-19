## code to prepare `DATASET` dataset goes here
library(tidyverse)
library(here)

chemical_probes <- htmltab::htmltab('http://www.chemicalprobes.org/browse_probes', which = 1) %>%
  janitor::clean_names() %>%
  separate_rows("protein_target", sep=",") %>%
  mutate(protein_target = trimws(protein_target))

#I submitted the above "protein_target" column through HGNC's multi symbol checker:
#  https://www.genenames.org/tools/multi-symbol-checker/
#
#I copied the list using:
#  clipr::write_clip(chemical_probes$protein_target)

HGNC_name_matches = read_csv(here('data-raw/hgnc-symbol-check.csv'), skip=1) %>%
  janitor::clean_names() %>%
  filter(match_type == "Approved symbol")

chemical_probes = chemical_probes %>%
  left_join(HGNC_name_matches %>% select(input,approved_symbol),
            by=c('protein_target' = 'input')) %>%
  rename(hgnc_symbol = approved_symbol) %>%
  arrange(hgnc_symbol)

usethis::use_data(chemical_probes, overwrite = T)
