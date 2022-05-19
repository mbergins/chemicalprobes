# Chemical Probes Data

This a simple R data package that contains the list avaialble at chemicalprobes.org. The package only provides one R data object "chemical_probes", which is copy of the data from chemical probes re-formatted to follow tidy data principles. I've also added HGNC names when available, although most of the names used on the website already appear to be HGNC. Further documenation is available after loading the package. 

I am not affiliated with chemical probes. I made this project because I found it useful to be able to quickly cross reference the chemical probes database when I was conducting other bioinformatics analyses and thought others might like to be able to do the same thing.

# Citation

If you use this package, you should cite the primary chemical probes publication:

The promise and peril of chemical probes, Arrowsmith et al Nat Chem Biol 2015 11;536-531. doi: [10.1038/nchembio.1867](https://dx.doi.org/10.1038/nchembio.1867) ( Nature Chemical Biology)

# Installation

The package can be installed with devtools:

```{r}
devtools::install_github('mbergins/chemicalprobes')
```
# Usage

You should now have access to a variable named chemical_probes:

```{r}
help("chemical_probes")
```

# Reproduciblity

If you want to rebuild this package, you will first need to sign up for an account at chemical probes and download the latest data set from them. From there, the critical line you will need to change is near the top of [`DATASET.R`](data-raw/DATASET.R).
