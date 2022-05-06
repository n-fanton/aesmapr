#' Create rectangular boundary box
#'
#' Create rectangular boundary centred on a set location
#'
#' @param location A vector consisting of easting and northing,
#' e.g. \code{c(349950, 673605)}
#' @param y_dist Distance (in metres) north and south of the location
#' to be displayed. Map shows \code{y_dist} metres north, and
#' \code{y_dist} metres south.
#' @param x_dist Distance (in metres) east and west of the location
#' to be displayed. Map shows \code{y_dist} metres north, and
#' \code{y_dist} metres south.
#'
#' @return An st polygon with four points.
#' @export
#'
#' @examples
#'
#' create_box(location = c(349950, 673605), x_dist = 3000, y_dist = 1000)
create_box <-
  function(
    location,
    y_dist = 2500,
    x_dist = y_dist * 2/3
  ) {
    box <- c(location[1] + x_dist, location[2] + y_dist) %>%
      base::rbind(c(location[1] + x_dist, location[2] - y_dist)) %>%
      base::rbind(c(location[1] - x_dist, location[2] + y_dist)) %>%
      base::rbind(c(location[1] - x_dist, location[2] - y_dist)) %>%
      tibble::as_tibble() %>%
      sf::st_as_sf(coords = c("V1", "V2"),
                   crs = 27700) %>%
      dplyr::summarise() %>%
      sf::st_cast("POLYGON") %>%
      sf::st_convex_hull()

    return(box)
  }
