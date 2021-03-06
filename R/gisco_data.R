#' GISCO database
#'
#' Database with the list of files that the package can load.
#'
#' @concept dataset
#'
#' @name gisco_db
#'
#' @docType data
#'
#' @format A data frame
#'
#' @details This dataframe is used to check the validity of the API calls.
#'
#' @source GISCO API `datasets.json`.
#'
#' @examples
#'
#' data(gisco_db)
NULL

#' World countries `POLYGON` object
#'
#' @concept dataset
#'
#' @name gisco_countries
#'
#' @description A `sf` object including all
#' countries as provided by GISCO (2016 version).
#'
#' @format
#' A `MULTIPOLYGON` data frame (resolution: 1:20million, EPSG:4326) object
#' with 257 rows and 7 variables:
#'   * **id**: row ID
#'   * **CNTR_NAME**: Official country name on local language
#'   * **ISO3_CODE**: ISO 3166-1 alpha-3 code of each country, as provided by
#'   GISCO
#'   * **CNTR_ID**: Country ID
#'   * **NAME_ENGL**: Country name in English
#'   * **FID**: FID
#'   * **geometry**: geometry field
#'
#' @examples
#'
#' cntry <- gisco_countries
#' GBR <- subset(cntry, ISO3_CODE == "GBR")
#'
#' library(tmap)
#'
#' tm_shape(GBR) +
#'   tm_polygons(col = "red3", border.col = "blue4")
#' @source
#' [`CNTR_RG_20M_2016_4326.geojson`](https://gisco-services.ec.europa.eu/distribution/v2/countries/geojson/) file.
#'
#' @docType data
#'
#' @seealso [gisco_get_countries()]
#'
#' @encoding UTF-8
NULL

#' World coastal lines `POLYGON` object
#'
#' A `sf` object as provided by GISCO (2016 version).
#'
#' @concept dataset
#'
#' @name gisco_coastallines
#'
#' @format
#' A `POLYGON` data frame (resolution: 1:20million, EPSG:4326) object with
#' 3 variables:
#'   * **FID**
#'   * **COAS_ID**
#'   * **geometry**: geometry field
#'
#' @source
#' [`COAS_RG_20M_2016_4326.geojson`](https://gisco-services.ec.europa.eu/distribution/v2/coas/geojson/) file.
#'
#' @docType data
#'
#' @seealso [gisco_get_coastallines()]
#'
#' @examples
#'
#' coasts <- gisco_coastallines
#'
#' library(tmap)
#'
#' tmap_style("classic")
#'
#' qtm(coasts) + tm_compass(
#'   position = c("left", "bottom"),
#'   color.dark = "chocolate"
#' )
#'
#' tmap_options_reset()
NULL

#' All NUTS `POLYGON` object
#'
#' A `sf` object including all NUTS levels as provided by GISCO (2016 version).
#'
#' @concept dataset
#'
#' @name gisco_nuts
#'
#' @format
#' A `POLYGON` data frame (resolution: 1:20million, EPSG:4326) object with
#' 11 variables:
#'   * **id**: row ID
#'   * **COAST_TYPE**: COAST_TYPE
#'   * **MOUNT_TYPE**: MOUNT_TYPE
#'   * **NAME_LATN**: Name on Latin characters
#'   * **CNTR_CODE**: Eurostat Country code
#'   * **FID**: FID
#'   * **NUTS_ID**: NUTS identifier
#'   * **NUTS_NAME**: NUTS name on local alphabet
#'   * **LEVL_CODE**: NUTS level code (0,1,2,3)
#'   * **URBN_TYPE**: URBN_TYPE
#'   * **geometry**: geometry field
#'
#' @source
#' [`NUTS_RG_20M_2016_4326.geojson`](https://gisco-services.ec.europa.eu/distribution/v2/nuts/geojson/) file.
#'
#' @docType data
#'
#' @seealso [gisco_get_nuts()]
#'
#' @examples
#'
#' nuts <- gisco_nuts
#'
#' italy <- subset(nuts, CNTR_CODE == "IT" & LEVL_CODE == 3)
#'
#' library(tmap)
#'
#' tm_shape(italy) +
#'   tm_polygons()
#' @encoding UTF-8
NULL


#' Dataframe with different country code schemes and world regions
#'
#' @name gisco_countrycode
#'
#' @concept dataset
#'
#' @description
#' A dataframe containing conversions between different country
#' code schemes (Eurostat/ISO2 and 3) as well as geographic regions as
#' provided by the World Bank and the UN (M49). This dataset
#' is extracted from **countrycode** package.
#'
#' @format
#' A data frame object with 249 rows and 12 variables:
#'   * **CNTR_CODE**: Eurostat code of each country
#'   * **iso2c**: ISO 3166-1 alpha-2 code of each country
#'   * **ISO3_CODE**: ISO 3166-1 alpha-3 code of each country
#'   * **iso.name.en**: ISO English short name
#'   * **cldr.short.en**: English short name as provided by the Unicode Common
#'   Locale Data Repository
#'   <http://cldr.unicode.org/translation/displaynames/country-names>
#'   * **continent**: As provided by the World Bank
#'   * **un.region.code**: Numeric region code UN (M49)
#'   * **un.region.name**: Region name UN (M49)
#'   * **un.regionintermediate.code**: Numeric intermediate Region
#'    code UN (M49)
#'   * **un.regionintermediate.name**: Intermediate Region name UN (M49)
#'   * **un.regionsub.code**: Numeric sub-region code UN (M49)
#'   * **un.regionsub.name**: Sub-Region name UN (M49)
#'   * **eu**: Logical indicating if the country belongs to the European
#'   Union as per February 2021.
#'
#' @examples
#'
#' data(gisco_countrycode)
#' @source [`countrycode::codelist`] **v1.2.0**.
#'
#' @seealso [`countrycode::codelist`], [`countrycode::countrycode-package`]
#'
#' @docType data
NULL

#' Disposable income of private households by NUTS 2 regions
#'
#' @name tgs00026
#'
#' @concept dataset
#'
#' @source <https://ec.europa.eu/eurostat>, extracted on 2020-10-27
#'
#' @description
#' The disposable income of private households is the balance
#' of primary income (operating surplus/mixed income plus compensation of
#' employees plus property income received minus property income paid) and
#' the redistribution of income in cash. These transactions comprise social
#' contributions paid, social benefits in cash received, current taxes on
#' income and wealth paid, as well as other current transfers. Disposable
#' income does not include social transfers in kind coming from public
#' administrations or non-profit institutions serving households.
#' @format
#' data_frame:
#'   * **geo**: NUTS2 identifier
#'   * **time**: reference year (2007 to 2018)
#'   * **values**: value in euros
#'
#' @examples
#'
#' data(tgs00026)
#' @docType data
NULL
