# Following are the parameters used in ASLtbx First image: label Subtraction Method: simple subtraction
# Subtraction Order: control - label Applying Mask for Output: yes Create Mean Images: yes Calculate qCBF: yes
# Output PseudoBOLD Images: no Save deltaM Images: no Save qCBF Images: yes Using a unique M0 value for all
# voxels: yes Output Image Format: nifti Saving 4D Image Series: yes Select ASL type: CASL Magnetic Field: 3T
# Label Time (sec): 2 Post-Labeling Delay Time (sec): 0.8 Slice Acquisition Time (msec): 45 Use Additionally
# acquired M0 Image for CASL: no Label Efficiency: 0.68
# --------------------------------------------------------------------------------------
cbf_casl2_ASLtbx <- function(aslimg_filename) {
  img <- as.array(antsImageRead(aslimg_filename, 4))
  
  # number of terms in the integration of finite-difference
  numdiffs <- floor(dim(img)[length(dim(img))]/2)
  
  labelimg <- img[, , , seq(1, by = 2, length.out = numdiffs)]
  controlimg <- img[, , , seq(2, by = 2, length.out = numdiffs)]
  
  efftcbf <- (controlimg - labelimg)/controlimg
  lambda <- 0.9
  bloodt1 <- 1664
  r1a <- 1/bloodt1
  labeff <- 0.68
  slicetime <- 45
  delaytime <- 800
  slicetimearray <- array(0, dim(controlimg))
  for (slice in 2:dim(controlimg)[length(dim(controlimg)) - 1]) slicetimearray[, , slice, ] <- slicetimearray[, 
    , slice - 1, ] + slicetime
  
  omega <- slicetimearray + delaytime
  labeltime <- 2000
  
  cbf <- (6000 * 1000 * lambda * r1a * efftcbf)/(2 * labeff * (exp(-omega * r1a) - exp(-(labeltime + omega) * 
    r1a)))
  
  return(cbf)
} 
