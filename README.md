# Chemical Probes Data

This a simple R data package that contains the list avaialble at chemicalprobes.org. The package only provides one R data object "chemical_probes", which is copy of the table at "http://www.chemicalprobes.org/browse_probes" re-formatted to follow tidy data principles. I've also added HGNC names when available, although most of the names used on the website already appear to be HGNC. Further documenation is available after loading the package.

# Installation

The package can be installed with devtools:

```{r}
devtools::install_github('mbergins/chemicalprobes')
```
