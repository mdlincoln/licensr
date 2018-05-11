get_desc_path <- function(pkg) {
  pkg_path <- try(find.package(pkg), silent = TRUE)
  # If a package name is sent but not installed, send warning and return NA
  if (inherits(pkg_path, "try-error")) {
    warning("Package ", pkg, " cannot be found.")
    return(NA_character_)
  }
  paste0(pkg_path, "/DESCRIPTION")
}

get_license <- function(pkg) {
  pkg_path <- get_desc_path(pkg)
  license_txt <- try(suppressWarnings({
    read.dcf(pkg_path, fields = "License")[1,1]
  }), silent = TRUE)
  # If license is unreadable or not available, send warning and return NA
  if (inherits(license_txt, "try-error")) {
    warning("License field for ", pkg, " could not be read.")
    return(NA_character_)
  }
  license_txt
}

#' Find licenses for specified packages
#'
#' @param pkglist Character. Package names.
#' @param sort Boolean. Return results sorted by license type? If `FALSE`
#'   returns in the order of packages listed in `pkglist`
#'
#' @return A data frame with package names and package licenses
#'
#' @export
package_licenses <- function(pkglist, sort = TRUE) {
  stopifnot(is.character(pkglist))
  license_vector <- vapply(pkglist, function(x) get_license(x), FUN.VALUE = character(1))
  df <- tibble::tibble(
    package = pkglist,
    license = license_vector)
  if (sort) return(df[order(df[["license"]]),])
  df
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
