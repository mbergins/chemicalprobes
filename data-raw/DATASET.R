library(tidyverse)
library(here)
library(janitor)

chemical_probes <- read_csv(here('data-raw/ChemicalProbesPortal-5_19_2022.csv')) %>%
  clean_names() %>%
  separate_rows("target_name", sep=",") %>%
  mutate(target_name = trimws(target_name)) %>%
  filter(probe_name != "Please cite the Chemical Probes Portal")

#I submitted the above "target_name" column through HGNC's multi symbol checker:
#  https://www.genenames.org/tools/multi-symbol-checker/
#
#I copied the list using:
#  clipr::write_clip(chemical_probes$target_name)

HGNC_name_matches = read_csv(here('data-raw/hgnc-symbol-check.csv'), skip=1) %>%
  clean_names() %>%
  filter(match_type == "Approved symbol")

chemical_probes = chemical_probes %>%
  left_join(HGNC_name_matches %>% select(input,approved_symbol),
            by=c('target_name' = 'input')) %>%
  rename(hgnc_symbol = approved_symbol) %>%
  arrange(hgnc_symbol)

usethis::use_data(chemical_probes, overwrite = T)
