#' Find all OS squares contained within a boundary
#'
#' Uses \code{\link{find_square()}} to find the OS 100km squares required to
#' draw a selected area.
#'
#' Creates \code{bbox} around the input \code{boundary} polygon, and looks
#' for the boxes containg the four corners.
#'
#' @param boundary An \code{st} object of a single row,
#' containing a single polygon.
#'
#' @return A vector containing the names of OS squares required to draw
#' the area.
#' @export

required_squares <- function(boundary) {
  bounding_box <- st_bbox(boundary)

  square1 <- aesmapr::find_square(c(bounding_box$xmin, bounding_box$ymin))
  square2 <- aesmapr::find_square(c(bounding_box$xmin, bounding_box$ymax))
  square3 <- aesmapr::find_square(c(bounding_box$xmax, bounding_box$ymin))
  square4 <- aesmapr::find_square(c(bounding_box$xmax, bounding_box$ymax))

  required_squares <-
    c(square1, square2, square3, square4) %>%
    unique()

  return(required_squares)

}
