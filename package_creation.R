# Consult these tutorials for debugging: 
# https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
# http://kbroman.org/pkg_primer/pages/build.html
# https://www.rstudio.com/wp-content/uploads/2015/06/devtools-cheatsheet.pdf

# Move to the directory just above your package directory, and run these commands.
packages = c("devtools","tidyr","ggplot2","roxygen2","testthat")
lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE, INSTALL_opts = '--no-lock')
    library(x, character.only = TRUE)
  }
})

setwd('./LoD')
document()
setwd('..')
install('LoD')
# Verify that the documentation generated.
?amplification_input_table()
# Run unit tests.
setwd('./LoD')
devtools::test()
