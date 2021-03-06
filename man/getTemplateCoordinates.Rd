\name{getTemplateCoordinates}
\alias{getTemplateCoordinates}

\title{
Define an anatomical coordinate system in a new image based on a template
}

\description{
 This function will provide a mapping that labels an input image and its blobs.

 Uses Matthew Brett's mni2tal to get the final Talairach coordinates from MNI space.
}

\usage{
wcoords<-getTemplateCoordinates( list(bindtem,clust) , mymni , convertToTal = TRUE, outprefix = "/tmp/Q" )
}

\arguments{
  \item{x}{
  x
  }
}
\details{
  This is a standard approach but it's not very accurate.
}


\value{
  The output point is in approximate template space.
}

\author{
  Avants, BB
}

\examples{
\dontrun{
#
# ch2bet is available in chris rorden's mricron 
#  but you can do something with any other image 
#  e.g. a statistical image 
#
  tem<-antsImageRead('ch2bet.nii.gz',3)
  clust <- antsImageClone( tem )  
  clust[ tem < 80 ]<- 0
  clust[ tem > 90 ]<- 0
  clust[  tem > 80 & tem < 90 ]<- 1
  ImageMath(3, clust,"ME",clust,1)  # erosion 
  clust <- labelClusters( clust , minClusterSize=30, minThresh=1, maxThresh=1)
  if ( ! exists("mymni") ) {
  # try getANTsRData if you have www access
    mymni<-list( antsImageRead(getANTsRData('mni'),3), 
                 antsImageRead(getANTsRData('mnib'),3), 
                 antsImageRead(getANTsRData('mnia'),3) )
  }
  template_cluster_pair<-list(tem,clust)
  gcoords<-getTemplateCoordinates( template_cluster_pair , mymni , convertToTal = TRUE )
# output will be like 
# > gcoords$templatepoints
#     x   y   z t label Brodmann                 AAL
# 1  -12  13  -3 0     1        0           Caudate_R
# 2   13  16   5 0     2        0           Caudate_L
#
# can also use a white matter label set ...
# 
}
}
\keyword{Talairach, Template, Coordinates}
