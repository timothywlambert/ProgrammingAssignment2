## These function will calculate the inverse of a matrix and store the result in cache.

## makeCacheMatrix opens up MASS package to calculate the inverse of a matrix using the ginv function and stores it in an object

## Create a matrix first and assign it variable x
## Assign makeCacheMatrix to variable y and run

makeCacheMatrix <- function(x = matrix()) {
  library(MASS)
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  
  setinverse <- function(ginv) m <<- ginv
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse) 
}

## This function calculates the inverse of matrix
## Assign this function to z and run

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- ginv(data, ...)
  x$setinverse(m)
  m
}
