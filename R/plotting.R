install.packages("roxygen2")
install.packages("ggplot2")

library(roxygen2)
library(dplyr)
library(ggplot2)

vcf_histogram <- function(vcf, ...) {
  require(VariantAnnotation)
  require(dplyr)
  require(ggplot2)

  info <- as_tibble(info(exVCF))
  plot <- info %>%
    group_by(consequence) %>%
    summarise(n = n())
  ggplot(aes(x = consequence, y = n, fill = consequence)) +
    geom_bar(stat = "identity") +
    theme(axis.text.x = element_blank())

  return(plot)
}
