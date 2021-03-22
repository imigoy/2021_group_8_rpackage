
#Testing out the random DNA function to get an idea of what we are doing.
# R/random_dna.R
random_dna <- function(l){
  nucleotides <- sample(c("A", "T", "G", "C"), size = 99, replace = TRUE) 
  dna = paste0(nucleotides, collapse = "")
  return(dna)
}

#This gives a random DNA string of 99 basepairs


