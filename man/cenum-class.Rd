\name{cenum-class}
\docType{class}
\alias{cenum-class}
\alias{toarr,cenum-method}
\alias{gonext,cenum-method}
\alias{initialize,cenum-method}
\alias{show,cenum-method}

\title{Class \code{"cenum"}}

\description{
  Encapsulation of a combinations iterator object.
}

\section{Slots}{
  \describe{
    \item{\code{env}:}{Object of class \code{"environment"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{toarr}{\code{signature(object = "cenum")}: return the current combination as an integer array}
    \item{gonext}{\code{signature(object = "cenum")}:
      move the iterator forward, 
      to the next combination if k=1 or left unspecified, 
      to the combination obtained after skipping k-1 ones if k > 1}
    \item{initialize}{\code{signature(.Object = "cenum")}: initialize a combinations iterator (p among n)}
    \item{show}{\code{signature(object = "cenum")}: print the current combination as an integer array}
   }
}

\examples{
  showClass("cenum")
}
