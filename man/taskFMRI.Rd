\name{taskFMRI}
\alias{taskFMRI}

\title{
Simple taskFMRI function.
}

\description{
Input 4D time series matrix. (Perform slice timing correction externally). Estimate hemodynamicRF from block design. Compute brain mask on average bold image.  
Get nuisance variables :  motion , compcor , globalsignal.  High-frequency filter the time series ( externally ).
Correct for autocorrelation using bullmore 1996 MRM and AR(2) model with parameters derived from global residual signal.
Estimate final glm. 
}

\usage{
activationBeta<-taskFMRI(  fmriMatrix , blockDesign )
}

\arguments{
\item{fmriMatrix}{
  input matrix
}
\item{blockDesign}{
  input array
}
}

\value{
c( betas ) is output
}

\author{
Avants BB
}

\examples{
# read the fmri image in and maybe do slice timing correction 
#  fmri<-antsImageRead( fn[2] , 4 )
#  ImageMath(4,fmri,'SliceTimingCorrection',fmri,'bspline')
  myvars<-getfMRInuisanceVariables( fmri, moreaccurate = TRUE ,  maskThresh=100 )
  mat <- timeseries2matrix( fmri, mask )
  mat  <- filterfMRIforNetworkAnalysis( cbind(mat) , 2.5, cbfnetwork = "BOLD" , freqLo=0.001 , freqHi = 0.15  )$filteredTimeSeries
  blockfing = c(0, 36, 72, 108,144)
  hrf <- hemodynamicRF( scans=dim(fmri)[4] , onsets=blockfing , durations=rep(  12,  length( blockfing ) ) ,  rt=2.5 )
  activationBeta<-taskFMRI(  fmriMatrix , hrf , myvars )
}
