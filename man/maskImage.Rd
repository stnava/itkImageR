\name{maskImage}
\alias{maskImage}
\title{
Mask input image by mask image.
}
\description{
  Mask an input image by a mask image.  If the mask image has multiple labels, it is possible to specify which label(s) to mask at.
}

\usage{
  maskImage(img.in, img.mask, level=1, binarize = FALSE )
}

\arguments{
  \item{img.in}{Input image.}
  \item{img.mask}{Mask or label image.}
  \item{level}{Level at which to mask image.}
  \item{binarize}{binarize the output image}
}

\value{ An object of type antsImage.}
\author{Kandel BM and Avants B.}

\examples{
  myimg <- antsImageRead(getANTsRData("ch2"), 3)
  mylab <- antsImageRead(getANTsRData("ch2a"), 3)
  myimg.mask <- maskImage(myimg, mylab, 3)
  plotANTsImage(myimg.mask, axis=3, slices="90x90x90")
  myimg.mask <- maskImage(myimg, mylab, list( 1,  3, 9 ) )
}
