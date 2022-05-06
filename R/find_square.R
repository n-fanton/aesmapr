#' Find the OS square for a location
#'
#' Find the OS 100km grid square containig the location based on easting
#' and northing.
#'
#' For information on the 100km grid, see
#' \url{https://www.ordnancesurvey.co.uk/documents/resources/guide-to-nationalgrid.pdf}
#'
#' @param location A vector consisting of easting and northing,
#' e.g. \code{c(349950, 673605)}
#'
#' @return
#' @export
#'
#' @examples
#'
#' find_square(c(349950, 673605))
find_square <- function(location) {
  square <-
    # Create table with OS grid 100km square references
    # (Row 1 is SOUTH, row 12 NORTH, for selection based on grid reference)
    aesmapr::os_squares %>%
    # Select column - grid reference is in metres, so divide into 100km
    dplyr::select((location[1] %/% 100000) + 1) %>%
    # Select row, again divide into 100km
    dplyr::slice((location[2]  %/% 100000) + 1) %>%
    dplyr::pull()

  return(square)
}
