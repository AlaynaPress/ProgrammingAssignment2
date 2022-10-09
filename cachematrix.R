
# This function makes the matrix, then inverts it. 
makeCacheMatrix <- function(x = matrix()) {
    t <- NULL
  
    
    set <- function(y) {
    x <<- y
    t <<- NULL
  }
    
  get <- function() x
  setinverse<- function(solve) t <<- solve
  getinverse <- function() t
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

#This function works with the above function in order to calculate the inverse of the matrix above.

cacheSolve <- function(x, ...) {

  t <- x$getinverse()
  
    if(!is.null(t)) {
    message("getting cached data")
    return(t)
  }
  data <- x$get()
  t <- solve(data, ...)
  
    x$setinverse(t)
  
    t
}
