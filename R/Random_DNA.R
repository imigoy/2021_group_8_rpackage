
#Testing out the random DNA function to get an idea of what we are doing.
# R/random_dna.R
random_dna <- function(l){
  nucleotides <- sample(c("A", "T", "G", "C"), size = l, replace = TRUE)
  dna = paste0(nucleotides, collapse = "")
  return(dna)
}