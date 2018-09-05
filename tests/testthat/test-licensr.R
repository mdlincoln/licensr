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

test_that("Warnings and NAs for missing packages", {
  pkgs <- c("testthat", "notapackage")
  expect_warning(ts <- package_licenses(pkgs, sort = FALSE), fixed = "notapackage", all = TRUE)
  expect_equivalent(ts[[2, "package"]], "notapackage")
  expect_equivalent(ts[[2, "license"]], NA_character_)
})

test_that("Project packages functions for a package", {
  expected_pkgs <- c("assertthat", "cli", "crayon", "fansi", "pillar", "rlang", "tibble", "utf8")
  test_package_path <- system.file("tpkg", package = "licensr", mustWork = TRUE)
  expect_equivalent(sort(project_packages(test_package_path)), sort(expected_pkgs))
  expect_equivalent(sort(project_licenses(test_package_path)$package), sort(expected_pkgs))
})

test_that("Project packages functions for a project", {
  expected_pkgs <- c("assertthat")
  test_project_path <- system.file("tprj", package = "licensr", mustWork = TRUE)
  expect_equivalent(sort(project_packages(test_project_path)), sort(expected_pkgs))
  expect_equivalent(sort(project_licenses(test_project_path)$package), sort(expected_pkgs))
})

