#' Data from chemicalprobes.org
#'
#' This is a copy of the HTML table from chemicalprobes.org with some extra
#' processing to add the official HGNC name for the target when missing
#'
#' @format A data frame with 320 rows and 7 variables: \describe{
#'   \item{probe_name}{Chemical Name}
#'   \item{protein_target}{Protein targeted by the probe}
#'   \item{target_class}{Type of protein target}
#'   \item{subclass}{Subclass of the targeted protein}
#'   \item{number_of_sab_reviews}{Number of reviews from the scientific advisory board}
#'   \item{avg_rating_in_cells}{Average rating from the scientific advisory board}
#'   \item{hgnc_symbol}{The HGNC symbol associated with the protein target when available}
#'   }
"chemical_probes"
