\name{pcenum help}
\alias{pcenum}
\alias{pinit}
\alias{cinit}
\alias{gonext}
\alias{toarr}

\title{Iterate through permutations or combinations}

\description{
  Object-oriented iteration over permutations of [1,...,n] 
  and combinations of p elements among [1,...,n].

  \code{pinit} initializes a permutations iterator (n objects).

  \code{cinit} initializes a combinations iterator (p among n).

  When an object 'obj' has been created through the above methods, 
  the two following key functions can be called on him.
  
  \code{gonext} moves the iterator forward, 
  to the next permutation/combination if k=1 or left unspecified, 
  to the permutation/combination obtained after skipping k-1 ones if k > 1.

  \code{toarr} returns the current permutation/combination as an integer array.
  
  Note: in command-line mode you can also just type 'obj' (name of object), 
        to have its content printed on screen in a readable way.
}

\usage{
  pinit(n)

  cinit(n, p)

  gonext(object, k=1)
  
  toarr(object)
}

\arguments{
  \item{n}{total number of elements}

  \item{p}{number of elements to pick, in case of combination; p <= n}

  \item{object}{an object as created by pinit() or cinit()}

  \item{k}{number of steps forward; default is 1 for next permutation/combination}
}

\value{
  \code{pinit} and \code{cinit} return an iterator object.
  
  \code{toarr} returns the integer vector representing the permutation/combination.
}

\references{
  P. Audibert, \bold{Enumerations dans l'ordre alphabetique}, course chapter 7, in french at http://www.ai.univ-paris8.fr/~audibert/ens/07-ENUMERATIONx.pdf
}

\examples{
  #print initial permutation, and 12 after,
  #for 1..10 (n=10)
  p = pinit(10)
  show(p)
  gonext(p, 12)
  show(p)
  #set x to the current permutation array
  x = toarr(p)
  #do something with x...

  #print initial combination, and 12 after,
  #for 1..10 (n=10) and p=3
  c = cinit(10,3)
  show(c)
  gonext(c, 12)
  show(c)
  #set x to the current combination tuple
  x = toarr(c)
  #do something with x...
}
