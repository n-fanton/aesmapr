#' Create aesthetic map of area around a postcode
#'
#' @param postcode A UK postcode, e.g. "EH3 7HG"
#' @param shape \code{"circle"} or \code{"rectangle"} to be drawn.
#' \code{"circle"} uses \code{\link{create_circle()}}
#' \code{"rectangle"} uses \code{\link{create_box()}}
#' @param shapefiles_folder Folder containing OS local map shapefile
#' @param y_dist If shape = \code{"rectangle"}, distance (in metres) north and
#' south of the location to be displayed. Map shows \code{y_dist} metres north,
#' and \code{y_dist} metres south.
#' @param x_dist If shape = \code{"rectangle"}, distance (in metres) east and
#' west of the location to be displayed. Map shows \code{y_dist} metres east,
#' and \code{y_dist} metres west.
#' @param radius If shape = \code{"circle"}, radius (in metres) around the
#' location to be displayed.
#' @param water_colour Hex code for colour to display water areas
#' @param land_colour Hex code for colour to display land
#' @param road_colour Hex code for colour to display roads
#'
#' @return A ggplot object
#' @export
#'
create_map <- function(
  postcode,
  shape = "rectangle",
  shapefiles_folder = "/Users/Shared/data/shapefiles/local_map",
  y_dist = 2500,
  x_dist = y_dist * 2/3,
  radius = 1500,
  water_colour = "#C0C0C0",
  land_colour = "#002240",
  road_colour = "#C0C0C0"
) {

  library("tidyverse")
  library("sf")

  # 1. Set location for mapping -----------------------------------------------
  location <- aesmapr::find_postcode_centre(postcode)

  # 2. Create bounding polygon for location -----------------------------------
  if (shape == "rectangle") {
    map_area <- aesmapr::create_box(location, y_dist = y_dist, x_dist = x_dist)
  } else if (shape == "circle") {
    map_area <- aesmapr::create_circle(location, radius = radius)
  } else {
    stop("Shape should be either 'rectangle' or 'circle'.")
  }

  # 3. Find required OS squares -----------------------------------------------
  squares <- aesmapr::required_squares(map_area)

  # 4. Read road data for location and restrict to bounding box ---------------
  roads <-
    aesmapr::read_road_data(
      folder = shapefiles_folder,
      squares = squares
    ) %>%
    sf::st_intersection(map_area)

  # 5. Read water data for location and restrict to bounding box --------------
  water <-
    aesmapr::read_water_data(
      folder = shapefiles_folder,
      squares = squares
    ) %>%
    sf::st_intersection(map_area)

  # 6. Read coastline data and restrict to bounding box -----------------------
  coastline <- aesmapr::coastline %>%
    sf::st_intersection(map_area)

  # 7. Create map -------------------------------------------------------------

  map <- ggplot2::ggplot() +
    ggplot2::geom_sf(
      data = map_area,
      fill = water_colour,
      colour = water_colour,
    ) +
    ggplot2::geom_sf(
      data = coastline,
      fill = land_colour,
      colour = NA
    ) +
    ggplot2::geom_sf(
      data = roads,
      colour = road_colour,
      aes(size = road_size)
    ) +
    ggplot2::geom_sf(
      data = water,
      fill = water_colour,
      colour = water_colour
    ) +
    ggplot2::scale_size_identity() +
    ggplot2::theme_void() +
    ggplot2::coord_sf(
      expand = FALSE,
      clip = "off"
    )

  return(map)
}

