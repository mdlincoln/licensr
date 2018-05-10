context("test-licensr")

test_that("multiplication works", {
  pkgs <- c("testthat")
  ts <- package_licenses(pkgs)
  expect_s3_class(ts, "data.frame")
})
