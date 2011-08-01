#called when package is loaded :
.First.lib <- function (lib, pkg)
{
  library.dynam("pcenum", pkg, lib)
}

#called when package is unloaded ( detach("package:pkg_name") )
.Last.lib <- function(path)
{
  library.dynam.unload("pcenum", path)
}
