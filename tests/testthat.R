library(testthat)
library(robarma)

# Ensure DLL is loaded (workaround for testthat)
if (!"robarma" %in% names(getLoadedDLLs())) {
    library.dynam("robarma", package = "robarma", lib.loc = .libPaths()[1])
}

test_dir("tests/testthat")
