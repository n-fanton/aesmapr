
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aesmapr

<!-- badges: start -->
<!-- badges: end -->

`aesmapr` helps you create nice looking (decorative) maps of a local
area.

Due to data availability, it can currently be used for GB locations
only.

## Installation

You can install the development version of aesmapr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("n-fanton/aesmapr")
```

## Example

The main function in `aesmapr` is `create_map()`, which allows you to
vary the location, shape, and extent of your outputs.

``` r
library("aesmapr")

map_1 <- create_map(
  postcode = "PH33 6TQ",
  x_dist = 3000,
  y_dist = 2000
)
#> Reading layer `NN_Road' from data source 
#>   `/Users/Shared/data/shapefiles/local_map/NN_Road.shp' using driver `ESRI Shapefile'
#> Simple feature collection with 16557 features and 7 fields
#> Geometry type: LINESTRING
#> Dimension:     XYZ
#> Bounding box:  xmin: 192147.8 ymin: 696679.9 xmax: 306104 ymax: 805219
#> z_range:       zmin: 0 zmax: 0
#> Projected CRS: OSGB 1936 / British National Grid
#> Reading layer `NN_SurfaceWater_Area' from data source 
#>   `/Users/Shared/data/shapefiles/local_map/NN_SurfaceWater_Area.shp' 
#>   using driver `ESRI Shapefile'
#> Simple feature collection with 7256 features and 2 fields
#> Geometry type: POLYGON
#> Dimension:     XYZ
#> Bounding box:  xmin: 186885.1 ymin: 681937.6 xmax: 306649.8 ymax: 810745
#> z_range:       zmin: 0 zmax: 0
#> Projected CRS: OSGB 1936 / British National Grid

map_1
```

<img src="man/figures/README-map_1-1.svg" width="100%" />

Maps can also draw circular areas, rather than rectangles:

``` r
map_2 <- create_map(
  postcode = "PH33 6TQ",
  shape = "circle",
  radius = 1500
)
#> Reading layer `NN_Road' from data source 
#>   `/Users/Shared/data/shapefiles/local_map/NN_Road.shp' using driver `ESRI Shapefile'
#> Simple feature collection with 16557 features and 7 fields
#> Geometry type: LINESTRING
#> Dimension:     XYZ
#> Bounding box:  xmin: 192147.8 ymin: 696679.9 xmax: 306104 ymax: 805219
#> z_range:       zmin: 0 zmax: 0
#> Projected CRS: OSGB 1936 / British National Grid
#> Reading layer `NN_SurfaceWater_Area' from data source 
#>   `/Users/Shared/data/shapefiles/local_map/NN_SurfaceWater_Area.shp' 
#>   using driver `ESRI Shapefile'
#> Simple feature collection with 7256 features and 2 fields
#> Geometry type: POLYGON
#> Dimension:     XYZ
#> Bounding box:  xmin: 186885.1 ymin: 681937.6 xmax: 306649.8 ymax: 810745
#> z_range:       zmin: 0 zmax: 0
#> Projected CRS: OSGB 1936 / British National Grid

map_2
```

<img src="man/figures/README-map_2-1.svg" width="100%" />

I’ll continue to add functionality to this package as I work more on it!
