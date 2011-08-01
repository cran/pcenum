setClass(Class="penum",
         representation=representation(
         env = "environment"))

# constructor
setMethod("initialize", signature="penum", definition=
  function(.Object, n) {
    env <- new.env(parent=emptyenv())
    env$a <- 1:n
    env$n <- n
    callNextMethod(.Object, env=env)
  })

# wrapper for the constructor
pinit <- function(n)
{
  new("penum", n)
}

# go to the next permutation (optionally skipping k-1 ones)
setMethod("gonext", signature="penum", definition=
  function(object, k=1)
  {
    env <- object@env
    env$a <- .C("goNextPermut",
                a=as.integer(env$a),
                n=as.integer(env$n),
                k=as.integer(k),
                nextA=integer(env$n),
                PACKAGE="pcenum")$nextA
  })

# return current permutation
setMethod("toarr", signature="penum", definition=
  function(object)
  {
    object@env$a
  })

# print current permutation
setMethod("show", signature="penum", definition=
  function(object)
  {
    print(toarr(object))
  })
