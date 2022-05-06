#' Read and combine OS water data for selected 100km square(s)
#'
#' Reads surface water data from OS local map, combines multiple squares (if
#' present) into one
#'
#' @param folder Folder containing OS maps
#' @param squares Character vector containing names of OS 100km squares needed.
#'
#' @return ST object of water areas
#' @export
#'
#' @examples
#' \dontrun{
#' read_water_data("/documents", c("NT", "NU"))
#' }
read_water_data <- function(folder, squares) {

  water <- sf::st_read(paste0(folder, "/", squares[1], "_SurfaceWater_Area.shp"))

  if(length(squares) > 1) {
    for (i in 2:length(squares)) {
      water <-
        base::rbind(
          water,
          sf::st_read(paste0(folder, "/", squares[i], "_SurfaceWater_Area.shp"))
        )
    }
  }

  water <- water %>%
    sf::st_zm() %>%
    janitor::clean_names()

  return(water)
}
