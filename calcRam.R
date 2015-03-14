# function to calc RAM needed to load a dat file
# 
calcRam <- function  (rows, cols, bytes) {
  return( rows * cols * bytes / 2^20 / 2^10)
}
