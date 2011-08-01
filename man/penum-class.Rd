\name{penum-class}
\docType{class}
\alias{penum-class}
\alias{toarr,penum-method}
\alias{gonext,penum-method}
\alias{initialize,penum-method}
\alias{show,penum-method}

\title{Class \code{"penum"}}

\description{
  Encapsulation of a permutations iterator object.
}

\section{Slots}{
  \describe{
    \item{\code{env}:}{Object of class \code{"environment"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{toarr}{\code{signature(object = "penum")}: return the current permutation as an integer array}
    \item{gonext}{\code{signature(object = "penum")}:
      move the iterator forward, 
      to the next permutation if k=1 or left unspecified, 
      to the permutation obtained after skipping k-1 ones if k > 1}
    \item{initialize}{\code{signature(.Object = "penum")}: initialize a permutations iterator (p among n)}
    \item{show}{\code{signature(object = "penum")}: print the current permutation as an integer array}
   }
}

\examples{
  showClass("penum")
}
