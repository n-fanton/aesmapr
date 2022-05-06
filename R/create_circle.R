#' Create circular boundary box
#'
#' Create circular boundary centred on a set location
#'
#' @param location A vector consisting of easting and northing,
#' e.g. \code{c(349950, 673605)}
#' @param radius Radius (in metres) around the location to be displayed.
#'
#' @return A circular st polygon.
#' @export
#'
#' @examples
#'
#' create_circle(location = c(349950, 673605), radius = 1500)
create_circle <- function(location, radius = 1000) {
  location %>%
    base::rbind() %>%
    tibble::as_tibble(.name_repair = "unique") %>%
    sf::st_as_sf(coords = c(1,2), crs = 27700) %>%
    sf::st_buffer(dist = radius)
}
