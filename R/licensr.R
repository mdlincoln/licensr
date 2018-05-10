package_desc_path <- function(pkg) {
  paste0(find.package(pkg), "/DESCRIPTION")
}

package_license <- function(pkg) {
  read.dcf(package_desc_path(pkg), fields = "License")[1,1]
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
  license_vector <- vapply(pkglist, function(x) package_license(x), FUN.VALUE = character(1))
  data.frame(license = license_vector, stringsAsFactors = FALSE)
}
