
if (requireNamespace("tinytest", quietly = TRUE)) {
  # Set home in dev mode
  home <- length(unclass(packageVersion("giscoR"))[[1]]) == 4

  if (home) {
    message("Full Testing")
  } else {
    message("On CRAN, skipping API tests")
  }

  tinytest::test_package("giscoR", at_home = FALSE)
}
