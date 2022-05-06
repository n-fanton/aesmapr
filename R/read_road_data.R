#' Read and combine OS road data for selected 100km square(s)
#'
#' Reads road data from OS local map, combines multiple squares (if present)
#' into one, and sets the sizes for roads to draw in ggplot
#'
#' @param folder Folder containing OS maps
#' @param squares Character vector containing names of OS 100km squares needed.
#'
#' @return ST object of roads
#' @export
#'
#' @examples
#' \dontrun{
#' read_road_data("/documents", c("NT", "NU"))
#' }
read_road_data <- function(folder, squares) {

  roads <- sf::st_read(paste0(folder, "/", squares[1], "_Road.shp"))

  if(length(squares) > 1) {
    for (i in 2:length(squares)) {
      roads <-
        base::rbind(
          roads,
          sf::st_read(paste0(folder, "/", squares[i], "_Road.shp"))
        )
    }
  }

  roads <- roads %>%
    sf::st_zm() %>%
    janitor::clean_names() %>%
    dplyr::mutate(
      road_size = dplyr::case_when(
        classifica == "Minor Road" ~ 0.3,
        classifica == "Local Road" ~ 0.21,
        classifica == "Restricted Local Access Road" ~ 0.2,
        classifica == "Local Access Road" ~ 0.2,
        classifica == "B Road" ~ 0.4,
        classifica == "A Road" ~ 0.6,
        classifica == "A Road, Collapsed Dual Carriageway" ~ 0.6,
        classifica == "B Road, Collapsed Dual Carriageway" ~ 0.4,
        classifica == "Shared Use Carriageway" ~ 0.4,
        classifica == "Motorway, Collapsed Dual Carriageway" ~ 0.5,
        classifica == "Motorway" ~ 0.5,
        classifica == "Primary Road" ~ 0.4,
        classifica == "Minor Road, Collapsed Dual Carriageway" ~ 0.3,
        classifica == "Primary Road, Collapsed Dual Carriageway" ~ 0.4
      )
    )

  return(roads)
}
