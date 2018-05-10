get_desc_path <- function(pkg) {
  paste0(find.package(pkg), "/DESCRIPTION")
}

get_license <- function(pkg) {
  read.dcf(get_desc_path(pkg), fields = "License")[1,1]
}

#' Find licenses for specified packages
#'
#' @param pkglist Character. Package names.
#'
#' @return A data frame with package names and package licenses
#'
#' @export
package_licenses <- function(pkglist) {
  stopifnot(is.character(pkglist))
  license_vector <- vapply(pkglist, function(x) get_license(x), FUN.VALUE = character(1))
  df <- tibble::tibble(
    package = pkglist,
    license = license_vector)
  df[order(df[["license"]]),]
}

# Find all packages in use within a given project
project_packages <- function(dir = ".") {
  packrat:::appDependencies(project = dir, implicit.packrat.dependency = FALSE)
}

#' Find licenses for all packages in a project directory
#'
#' @param dir Project directory. Defaults to current working directory.
#'
#' @return A data frame with package names and package licenses
#'
#' @export
project_licenses <- function(dir = ".") {
  package_licenses(project_packages(dir))
}
