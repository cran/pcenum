setClass(Class="cenum",
         representation=representation(
         env = "environment"))

# constructor
setMethod("initialize", signature="cenum", definition=
  function(.Object, n, p) {
    env <- new.env(parent=emptyenv())
    env$a <- c(rep(0,n-p), rep(1,p))
    env$n <- n
    env$humanA <- NULL # avoid some re-computations
    env$p <- p
    callNextMethod(.Object, env=env)
  })

# wrapper for the constructeur
cinit <- function(n, p)
{
  new("cenum", n, p)
}

# go to the next combination (optionally skipping k-1 ones)
setMethod("gonext", signature="cenum", definition=
  function(object, k=1)
  {
    env = object@env
    env$humanA <- NULL
    env$a <- .C("goNextCombi",
                a=as.integer(env$a),
                n=as.integer(env$n),
                k=as.integer(k),
                nextA=integer(env$n),
                PACKAGE="pcenum")$nextA
  })

# return current combination
setMethod("toarr", signature="cenum", definition=
  function(object)
  {
    env = object@env
    if (is.null(env$humanA)) {
      # get the combination as 'i j k',
      # instead of 0 0 ... 1 0 1 1 0 ... 0 [3 '1']
      env$humanA <-
        .C("translate",
           a=as.integer(rev(env$a)),
           n=as.integer(env$n),
           humanA=integer(env$p),
           PACKAGE="pcenum")$humanA
    }
    env$humanA
  })

# print current combination
setMethod("show", signature="cenum", definition=
  function(object)
  {
    print(toarr(object))
  })
