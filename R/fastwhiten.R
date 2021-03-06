fastwhiten <- function(x, mynu = NA) {
  if (nargs() == 0) {
    print("Usage:  x_whitened<-whiten( x ) ")
    return(1)
  }
  library(irlba)
  if (is.na(mynu)) 
    svdx <- irlba(x) else svdx <- irlba(x, nu = mynu, nv = 0)
  dd <- (svdx$d)^(-1/2)
  xw <- ((svdx$u %*% diag(dd)) %*% t(svdx$u)) %*% x
  return(xw)
} 
