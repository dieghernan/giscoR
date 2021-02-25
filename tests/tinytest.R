
if (requireNamespace("tinytest", quietly = TRUE)) {
  home <- !identical(Sys.getenv("NOT_CRAN"), "true")

  if (home) {
    message("Full Testing")
  } else {
    message("On CRAN, skipping API tests")
  }

  tinytest::test_package("giscoR", at_home = FALSE)
}
