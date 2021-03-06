\name{getMultivariateTemplateCoordinates}
\alias{getMultivariateTemplateCoordinates}

\title{
Label multivariate components by an anatomical coordinate system.
}

\description{
 This function will provide a mapping that labels the list of input images and each of their blobs.

 Uses getTemplateCoordinates as a sub-routine. 
}

\usage{
  outputnetwork<-getMultivariateTemplateCoordinates( list(template,component1,component2) , list(mniimage,mnilabel1,mnilabel2) , convertToTal = TRUE )
}

\arguments{
  \item{imageSetToBeLabeledIn}{
  a template paired with (most likely) the output of a multivariate sparse decomposition or (alternatively) could be just a statistical map with zeroes in non-interesting areas
  }
  \item{pvals}{
  the already computed pvalue for each component
  }
}
\details{
  TBN
}


\value{
  The output point coordinates are in approximate Talairach / MNI (or whatever) template space.
}

\author{
  Avants, BB
}

\examples{
\dontrun{
 tem<-antsImageRead('templates/template_brain.nii.gz',3)
 temlab<-antsImageRead('temp.nii.gz',3)
 temlab2<-antsImageRead('temp2.nii.gz',3)
 # try getANTsRData if you have www access
 mymni<-list( antsImageRead(getANTsRData('mni'),3), 
 	      antsImageRead(getANTsRData('mnib'),3), 
              antsImageRead(getANTsRData('mnia'),3) )
 mytem<-list(tem,temlab,temlab2)
 mynetworkdescriptor<-getMultivariateTemplateCoordinates(  mytem, mymni , convertToTal = TRUE , pvals=c(0.01,0.05) )
# output looks like 
#     NetworkID   x   y   z t label Brodmann AAL
# 1  N1_omnibus  -7   7  11 0     1        0  71
# 2     N1_node  50 -12 -21 0     1       20  90
# 3     N1_node -29  22   5 0     2       48  29
# 4     N1_node  25 -17  36 0     3        0   0
# 5     N1_node -25   4  39 0     4        0   0
# 6  N2_omnibus   7   1   3 0     1        0   0
# 7     N2_node  42 -14 -26 0     1       20  56
# 8     N2_node  20   7  -8 0     2       48  74
# 9     N2_node  -2  33 -10 0     3       11  31
# 10    N2_node -41 -34  23 0     4       48  17
# 11    N2_node  50 -37  24 0     5       41  82
# 12    N2_node -24  30  24 0     6       48   0
}
}
\keyword{Talairach, Template, Coordinates}
