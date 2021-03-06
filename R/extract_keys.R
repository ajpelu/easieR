#' Extract reference keys
#'
#' It extracts reference keys (\emph{e.g.} bibkeys) from a \code{Rmd} file
#' @param path The path of the \code{.Rmd} file
#' @return A \code{data frame} with all reference keys
#'
#' @import stringr
#' @author Antonio J Pérez-Luque (\email{ajpelu@@gmail.com})

#'
extract_keys <- function(path){
  f <- readLines(path)
  raw <- stringr::str_extract_all(string = f, pattern = "\\@[a-zA-z0-9]*") %>%
    unlist() %>%
    stringr::str_remove_all("]") %>%
    data.frame()
  names(raw) <- "bibkey"
  return(raw)
}
