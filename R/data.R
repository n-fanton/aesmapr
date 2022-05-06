#' Names of OS 100km squares in correct grid positions
#'
#' A table of names of OS 100km squares in correct grid positions to be
#' used with the \code{\link{find_square()}} function.
#'
#' The data is turned upside down, so that south is up. This coincides with the
#' OS grid which has origins in the south-west, so that the location with
#' easting 101000 (101km east of origin) and northing 101000 (101km north
#' of origin) is located in \code{os_squares[1,1]}
#'
#' For information on the 100km grid, see
#' \url{https://www.ordnancesurvey.co.uk/documents/resources/guide-to-nationalgrid.pdf}
"os_squares"

#' Coastline shape of the UK, used to differentiate land and sea in maps
"coastline"
