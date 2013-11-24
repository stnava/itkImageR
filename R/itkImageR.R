
itkImageR <- function( vec=c(1:3) ) {
    ## Make the call...
    val <- .Call("itkImageRFunction", vec, PACKAGE="itkImageR")
    val
}
