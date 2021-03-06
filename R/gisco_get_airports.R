#' Get location of airports and ports from GISCO API
#'
#' Loads a simple feature (`sf`) object from GISCO API or your local library.
#'
#' @concept infrastructure
#'
#' @return A `POINT` object on EPSG:4326.
#'
#' @param year Year of reference.
#'
#' @param country A list of countries, see [gisco_get_countries()]
#'
#' @source
#' <https://ec.europa.eu/eurostat/web/gisco/geodata/reference-data/transport-networks>
#'
#' @author dieghernan, <https://github.com/dieghernan/>
#'
#' @details
#' # Years available
#'
#' * **`gisco_get_airports`**:  "2006" and "2013"
#' * **`gisco_get_ports`**: "2009" and "2013"
#'
#'  Ports 2009 contains worldwide information, the rest of datasets refer
#'  to Europe. All shapefiles provided in EPSG:4326
#'
#' @examples
#'
#' library(sf)
#'
#' NL <- gisco_get_countries(country = "NL")
#' AirP_NL <- gisco_get_airports(country = "NL")
#'
#' Ports <- gisco_get_ports()
#' # Intersect with NL
#' PortsNL <- st_intersection(Ports, NL)
#'
#'
#' plot(st_geometry(NL), col = "wheat")
#' plot(
#'   st_geometry(PortsNL),
#'   pch = 22,
#'   col = "forestgreen",
#'   add = TRUE,
#'   cex = 0.8
#' )
#'
#' plot(
#'   st_geometry(AirP_NL),
#'   pch = 20,
#'   col = "steelblue",
#'   add = TRUE,
#'   cex = 1.2
#' )
#' legend(
#'   "topright",
#'   legend = c("Port", "Airport"),
#'   col = c("forestgreen", "steelblue"),
#'   cex = 0.9,
#'   bty = "n",
#'   pch = c(22, 20),
#'   pt.cex = c(1, 1.5),
#'   y.intersp = 2
#' )
#'
#' title(
#'   main = "Transport Network on the Nethelands",
#'   sub = gisco_attributions(),
#'   line = 1,
#'   cex.sub = 0.7,
#'   font.sub = 3
#' )
#' @export
gisco_get_airports <- function(year = "2013", country = NULL) {
  year <- as.character(year)
  if (!(year %in% c("2006", "2013"))) {
    stop("Year should be 2006 or 2013")
  }

  if (year == "2013") {
    data_sf <- airports2013
  } else if (year == "2006") {
    data_sf <- airports2006
  }

  if (!is.null(country) & "CNTR_CODE" %in% names(data_sf)) {
    country <- gsc_helper_countrynames(country, "eurostat")
    data_sf <- data_sf[data_sf$CNTR_CODE %in% country, ]
  }
  return(data_sf)
}

#' @rdname gisco_get_airports
#'
#' @export
gisco_get_ports <- function(year = "2013") {
  year <- as.character(year)
  if (!(year %in% c("2009", "2013"))) {
    stop("Year should be 2009 or 2013")
  }

  if (year == "2013") {
    data_sf <- ports2013
  } else if (year == "2009") {
    data_sf <- ports2009
  }
  return(data_sf)
}
