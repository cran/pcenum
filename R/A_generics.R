setGenericVerif <- function(x, y)
{
  if (!isGeneric(x))
  {
    setGeneric(x, y)
  }
}

# a generic function, to operate on different classes 
setGenericVerif("gonext", function(object, k=1) standardGeneric("gonext"))

# a generic function, to operate on different classes 
setGenericVerif("toarr", function(object) standardGeneric("toarr"))
