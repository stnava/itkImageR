\name{sparseDecom2}
\alias{sparseDecom2}

\title{
Convenience wrapper for 2-view eigenanatomy decomposition.
}

\description{
Decomposes two matrices into paired sparse eigenevectors to maximize canonical correlation.
}

\usage{
sparseDecom2( inmatrix=c(NA,NA),  inmask=c(NA,NA) , sparseness=c(0.01,0.01) , nvecs=50 , cthresh=c(250,250),  its=5  )
}

\arguments{
\item{inmatrix}{
 input as inmatrix=list(mat1,mat2). n by p input matrix and n by q input matrix , spatial variable lies along columns. 
}

\item{inmask}{
optional pair of antsImage masks
}

\item{other params}{
see sccan for other parameters
}

}

\value{
outputs a decomposition of a pair of matrices
}

\author{
Avants BB
}

\examples{
\dontrun{
mat<-replicate(100, rnorm(20)) 
mat2<-replicate(100, rnorm(20)) 
mydecom<-sparseDecom2( inmatrix=list(mat,mat2), sparseness=c(0.1,0.3) , nvecs=3, its=3, perms=0) 
wt<-0.666
mat3<-mat*wt+mat2*(1-wt) 
mydecom<-sparseDecom2( inmatrix=list(mat,mat3), sparseness=c(0.2,0.2), nvecs=5, its=10, perms=200 ) 

# a masked example
im<-antsImageRead( getANTsRData('r64') ,2)
dd<- im > 250
mask<-antsImageClone( im )
mask[ !dd ]<-0
mask[ dd ]<-1
mat1<-matrix( rnorm(sum(dd)*10) , nrow=10 )
mat2<-matrix( rnorm(sum(dd)*10) , nrow=10 )
initlist<-list()
for ( nvecs in 1:2 ) {
  init1<-antsImageClone( mask )
  init1[dd]<-rnorm(sum(dd))
  initlist<-lappend( initlist, init1 )
}
ff<-sparseDecom2( inmatrix=list(mat1,mat2), inmask=list(mask,mask),
  sparseness=c(0.1,0.1) ,nvecs=length(initlist) , smooth=1, cthresh=c(0,0), initializationList = initlist ,ell1 = 11 )


}
}
