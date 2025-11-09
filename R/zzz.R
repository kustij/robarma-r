# Package startup: load correct binary
.onLoad <- function(libname, pkgname) {
  library.dynam("robarmaR", pkgname, libname)
}
