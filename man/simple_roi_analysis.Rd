\name{simple_roi_analysis}
\alias{simple_roi_analysis}

\title{
Perform ROI population analysis between two groups.
}

\description{
Student's t-test performed for each labeled region within a specified mask to determine difference between a control group and an experimental group.
}

\usage{
roiResults <- simple_roi_analysis( dimensionality = 3, controlFileNames = c(),
  experimentalFileNames = c(), roiLabelsFileName = "" )
}

\arguments{
\item{dimensionality}{
  Dimension of images.
}

\item{imageFileNames}{
  List of image files.
}

\item{testType}{
  A value of 'lm', 'student.t', or 'wilcox'.  The latter two test types are assumed to be two-sampled parametric and non-parametric, respectively.
}

\item{predictors}{
  A simple vector or single column matrix or data frame specifying sample membership for student.t or wilcox testing.  For the 'lm' option, a data frame must be specified whose column names match the specified formula.
}

\item{formula}{
  Used with the 'lm' option for more sophisticated modeling.
}

\item{roiLabelsFileName}{
  File name of mask defining the region over which testing is performed (foreground voxel != 0, background voxel = 0)
}

}

\value{
list consisting of unique roi labels, t-values, and p-values.
}

\author{
Tustison NJ
}

\examples{
\dontrun{
# Get the image files
controlFileNames <- list.files( path = "./example_images/", pattern =
  glob2rx( "phantomtemplate_CONTROL*" ), full.names = TRUE, recursive = FALSE )
experimentalFileNames <- list.files( path = "./example_images/", pattern =
  glob2rx( "phantomtemplate_EXP*" ), full.names = TRUE, recursive = FALSE )

images <- c( controlFileNames, experimentalFileNames )
diagnosis <- c( rep( 1, length( controlFileNames ) ), rep( 0, length( experimentalFileNames ) ) )
age <- runif( length( diagnosis ), 25, 30 )
outputPath <- "./test_output/"

roiResults.ttest <- simple_roi_analysis( dimensionality = 2, imageFileNames = images,
  predictors = data.frame( diagnosis ),
  roiLabelsFileName = "./example_images/phantomtemplate_roi_labels.nii.gz", testType = 'student.t' )

roiResults.wilcox <- simple_roi_analysis( dimensionality = 2, imageFileNames = images,
  predictors = data.frame( diagnosis ),
  roiLabelsFileName = "./example_images/phantomtemplate_roi_labels.nii.gz", testType = 'wilcox' )

roiResults.lm <- simple_roi_analysis( dimensionality = 2, imageFileNames = images,
  predictors = data.frame( cbind( diagnosis, age ) ), formula = as.formula( value ~ 1 + diagnosis + age ),
  roiLabelsFileName = "./example_images/phantomtemplate_roi_labels.nii.gz", testType = 'lm' )
}
}
