# Package startup: load correct binary
.onLoad <- function(libname, pkgname) {
  library.dynam("robarma", pkgname, libname)
}
