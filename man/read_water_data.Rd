% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_water_data.R
\name{read_water_data}
\alias{read_water_data}
\title{Read and combine OS water data for selected 100km square(s)}
\usage{
read_water_data(folder, squares)
}
\arguments{
\item{folder}{Folder containing OS maps}

\item{squares}{Character vector containing names of OS 100km squares needed.}
}
\value{
ST object of water areas
}
\description{
Reads surface water data from OS local map, combines multiple squares (if
present) into one
}
\examples{
\dontrun{
read_water_data("/documents", c("NT", "NU"))
}
}
