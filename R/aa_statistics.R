#' Makes statistics about Amino Acids
#'
#' @description Takes a Amino-Acids string as input
#'
#' @param aa_statistics A string of Amino acids
#'
#' @return :statistics, maybe barplot?
#' @export
#'
#' @examples
#' aa_statistics("NIAM")
#'


aa_statistics <- function(aa_string){
  aa_length <- sum(aa_string)
  aliphatic <- sum(str_count(aa_string, c("L", "I", "A", "M", "V")))
  aromatic <- str_count(aa_string, c("F", "W", "Y"))
  neutral <- str_count(aa_string, c("N", "C", "Q", "S", "T", "G", "P"))
  acidc <- str_count(aa_string, c("D", "E"))
  basic <- str_count(aa_string, c("R", "H", "K"))
  
  aa_groups <- c("aliphatic", "aromatic", "neutral", "acdic", "basic")
  aa_count <-  c(aliphatic, aromatic, neutral, acdic, basic)
  
}