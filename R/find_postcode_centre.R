#' Find the centroid of a postcode
#'
#' Uses \link{https://postcodes.io} to find centre coordinates
#' of a postcode area
#'
#' @param postcode A UK postcode, e.g. EH41 4BN
#'
#' @return A vector containing easting and northing, e.g.
#' \code{c(352066, 673922)}
#' @export
#'
#' @examples find_postcode_centre("EH41 4BN")
find_postcode_centre <- function(postcode){

  postcode <- stringr::str_replace_all(postcode, " ", "")

  endpoint <- "http://api.postcodes.io/postcodes/"

  postcode_info <- httr::GET(url = paste0(endpoint, postcode)) %>%
    httr::content(as = "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    magrittr::extract2(2)

  return(c(postcode_info$eastings, postcode_info$northings))
}
