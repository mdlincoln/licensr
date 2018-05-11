context("test-licensr")

test_that("Locate license for one package", {
  pkgs <- c("testthat")
  ts <- package_licenses(pkgs)
  expect_s3_class(ts, "tbl")
  expect_equivalent(ts[["package"]], pkgs)
  expect_equivalent(ts[["license"]], "MIT + file LICENSE")
})

test_that("Locate license for multiple packages", {
  pkgs <- c("testthat", "assertthat")
  ts <- package_licenses(pkgs)
  unsort_ts <- package_licenses(pkgs, sort = FALSE)
  expect_s3_class(ts, "tbl")
  expect_s3_class(unsort_ts, "tbl")
  expect_equivalent(ts[["package"]], c("assertthat", "testthat"))
  expect_equivalent(ts[["license"]], c("GPL-3", "MIT + file LICENSE"))
  expect_equivalent(unsort_ts[["package"]], pkgs)
  expect_equivalent(unsort_ts[["license"]], c("MIT + file LICENSE", "GPL-3"))
})
