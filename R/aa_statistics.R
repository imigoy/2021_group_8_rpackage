#' Makes statistics about Amino Acids
#'
#' @description Takes a Amino-Acids string as input and creates a barplot of different
#' amino acid groups
#'
#' @param aa_statistics A string of Amino acids
#'
#' @return :statistics, maybe barplot?
#' @export
#'
#' @examples
#' aa_statistics("ALMVGLFNDR")
#'


aa_statistics <- function(aa_string){
  # counting amino acids
  aliphatic <- str_count(aa_string, c("L", "I", "A", "M", "V")) %>% sum()
  aromatic <- sum(str_count(aa_string, c("F", "W", "Y"))) %>% sum()
  neutral <- str_count(aa_string, c("N", "C", "Q", "S", "T", "G", "P")) %>% sum()
  acidc <- str_count(aa_string, c("D", "E")) %>% sum()
  basic <- str_count(aa_string, c("R", "H", "K")) %>% sum()
  
  # creating dataframe with counts
  aa_groups <- c("aliphatic", "aromatic", "neutral", "acidc", "basic")
  aa_count <-  c(aliphatic, aromatic, neutral, acidc, basic)
  aa_df <- as.data.frame(aa_groups, aa_count)
  
  # barplot 
  plot <- aa_df %>% 
    ggplot(mapping = aes(x = aa_groups, y = aa_count, fill= aa_groups )) +
    geom_col() +
    xlab("Amino Acid Groups") +
    ylab("Total Count") +
    theme(title = "Amino Acid Group Count", legend.position = "none")
  plot
}