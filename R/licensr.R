get_desc_path <- function(pkg) {
  pkg_path <- try(find.package(pkg), silent = TRUE)
  if (inherits(pkg_path, "try-error")) return(NA_character_)
  paste0(pkg_path, "/DESCRIPTION")
}

get_license <- function(pkg) {
  license_txt <- try(read.dcf(get_desc_path(pkg), fields = "License")[1,1], silent = TRUE)
  if (inherits(license_txt, "try-error")) return(NA_character_)
  license_txt
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
# TODO Using a non-exported function from packrat is gross, but they've solved
# the problem nicely already. I'm looking for a more minimalist extant
# solution...
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
