# this file defines ants-filters and their associate methods

############################# Abstract types and methods

setClass(Class = "antsFilter", representation("VIRTUAL"))

setGeneric(name = "antsSetInput", def = function(filter, image) standardGeneric("antsSetInput"))

setGeneric(name = "antsGetOutput", def = function(filter) standardGeneric("antsGetOutput"))

setGeneric(name = "antsUpdate", def = function(filter) standardGeneric("antsUpdate"))

setGeneric(name = "antsSetOutsideValue", def = function(filter, ...) standardGeneric("antsSetOutsideValue"))

setGeneric(name = "antsSetInsideValue", def = function(filter, ...) standardGeneric("antsSetInsideValue"))

setGeneric(name = "antsSetLowerThreshold", def = function(filter, ...) standardGeneric("antsSetLowerThreshold"))

setGeneric(name = "antsSetUpperThreshold", def = function(filter, ...) standardGeneric("antsSetUpperThreshold"))

setGeneric(name = "antsThresholdBelow", def = function(filter, ...) standardGeneric("antsThresholdBelow"))

setGeneric(name = "antsThresholdAbove", def = function(filter, ...) standardGeneric("antsThresholdAbove"))

setGeneric(name = "antsThresholdOutside", def = function(filter, ...) standardGeneric("antsThresholdOutside"))

setGeneric(name = "antsSetOrder", def = function(filter, ...) standardGeneric("antsSetOrder"))

############################# antsBinaryThresholdImageFilter

# C++ type used to represent pixels of the input image to the filter dimension of the input image to the
# filter C++ type used to represent pixels of the output image from the filter dimension of the output image
# to the filter pointer to the underlying C++ filter name of the filter; same as the itk filter name

setClass(Class = "antsBinaryThresholdImageFilter", representation(inputimage_pixeltype = "character", inputimage_dimension = "numeric", 
  outputimage_pixeltype = "character", outputimage_dimension = "numeric", pointer = "externalptr", filter = "character"), 
  contains = "antsFilter")

setMethod(f = "initialize", signature(.Object = "antsBinaryThresholdImageFilter"), definition = function(.Object, 
  inputimage_pixeltype, inputimage_dimension, outputimage_pixeltype, outputimage_dimension) {
  .Call("antsBinaryThresholdImageFilter_New", inputimage_pixeltype, inputimage_dimension, outputimage_pixeltype, 
    outputimage_dimension)
})

setMethod(f = "antsSetInput", signature(filter = "antsBinaryThresholdImageFilter", image = "antsImage"), definition = function(filter, 
  image) {
  .Call("antsBinaryThresholdImageFilter_SetInput", filter, image)
})

setMethod(f = "antsGetOutput", signature(filter = "antsBinaryThresholdImageFilter"), definition = function(filter) {
  .Call("antsBinaryThresholdImageFilter_GetOutput", filter)
})

setMethod(f = "antsUpdate", signature(filter = "antsBinaryThresholdImageFilter"), definition = function(filter) {
  .Call("antsBinaryThresholdImageFilter_Update", filter)
})

setMethod(f = "antsSetOutsideValue", signature(filter = "antsBinaryThresholdImageFilter"), definition = function(filter, 
  outsidevalue) {
  .Call("antsBinaryThresholdImageFilter_SetOutsideValue", filter, outsidevalue)
})

setMethod(f = "antsSetInsideValue", signature(filter = "antsBinaryThresholdImageFilter"), definition = function(filter, 
  insidevalue) {
  .Call("antsBinaryThresholdImageFilter_SetInsideValue", filter, insidevalue)
})

setMethod(f = "antsSetLowerThreshold", signature(filter = "antsBinaryThresholdImageFilter"), definition = function(filter, 
  lowerthreshold) {
  .Call("antsBinaryThresholdImageFilter_SetLowerThreshold", filter, lowerthreshold)
})

setMethod(f = "antsSetUpperThreshold", signature(filter = "antsBinaryThresholdImageFilter"), definition = function(filter, 
  upperthreshold) {
  .Call("antsBinaryThresholdImageFilter_SetUpperThreshold", filter, upperthreshold)
})

############################# antsThresholdImageFilter

setClass(Class = "antsThresholdImageFilter", representation(inputimage_pixeltype = "character", inputimage_dimension = "numeric", 
  pointer = "externalptr", filter = "character"), contains = "antsFilter")

setMethod(f = "initialize", signature(.Object = "antsThresholdImageFilter"), definition = function(.Object, inputimage_pixeltype, 
  inputimage_dimension) {
  .Call("antsThresholdImageFilter_New", inputimage_pixeltype, inputimage_dimension)
})

setMethod(f = "antsSetInput", signature(filter = "antsThresholdImageFilter", image = "antsImage"), definition = function(filter, 
  image) {
  .Call("antsThresholdImageFilter_SetInput", filter, image)
})

setMethod(f = "antsGetOutput", signature(filter = "antsThresholdImageFilter"), definition = function(filter) {
  .Call("antsThresholdImageFilter_GetOutput", filter)
})

setMethod(f = "antsUpdate", signature(filter = "antsThresholdImageFilter"), definition = function(filter) {
  .Call("antsThresholdImageFilter_Update", filter)
})

setMethod(f = "antsSetOutsideValue", signature(filter = "antsThresholdImageFilter"), definition = function(filter, 
  outsidevalue) {
  .Call("antsThresholdImageFilter_SetOutsideValue", filter, outsidevalue)
})

setMethod(f = "antsThresholdBelow", signature(filter = "antsThresholdImageFilter"), definition = function(filter, 
  threshold) {
  .Call("antsThresholdImageFilter_ThresholdBelow", filter, threshold)
})

setMethod(f = "antsThresholdAbove", signature(filter = "antsThresholdImageFilter"), definition = function(filter, 
  threshold) {
  .Call("antsThresholdImageFilter_ThresholdAbove", filter, threshold)
})

setMethod(f = "antsThresholdOutside", signature(filter = "antsThresholdImageFilter"), definition = function(filter, 
  lower, upper) {
  .Call("antsThresholdImageFilter_ThresholdOutside", filter, lower, upper)
})

############################# antsPermuteAxesImageFiter

setClass(Class = "antsPermuteAxesImageFilter", representation(inputimage_pixeltype = "character", inputimage_dimension = "numeric", 
  pointer = "externalptr", filter = "character"), contains = "antsFilter")

setMethod(f = "initialize", signature(.Object = "antsPermuteAxesImageFilter"), definition = function(.Object, 
  inputimage_pixeltype, inputimage_dimension) {
  .Call("antsPermuteAxesImageFilter_New", inputimage_pixeltype, inputimage_dimension)
})

setMethod(f = "antsSetInput", signature(filter = "antsPermuteAxesImageFilter", image = "antsImage"), definition = function(filter, 
  image) {
  .Call("antsPermuteAxesImageFilter_SetInput", filter, image)
})

setMethod(f = "antsGetOutput", signature(filter = "antsPermuteAxesImageFilter"), definition = function(filter) {
  .Call("antsPermuteAxesImageFilter_GetOutput", filter)
})

setMethod(f = "antsUpdate", signature(filter = "antsPermuteAxesImageFilter"), definition = function(filter) {
  .Call("antsPermuteAxesImageFilter_Update", filter)
})

setMethod(f = "antsSetOrder", signature(filter = "antsPermuteAxesImageFilter"), definition = function(filter, 
  order) {
  if (typeof(order) != "integer") {
    print("'order' provided is not of type 'integer'")
  }
  .Call("antsPermuteAxesImageFilter_SetOrder", filter, order)
}) 
