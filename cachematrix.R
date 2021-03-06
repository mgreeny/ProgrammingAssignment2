## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a special matrix that has the ability to cache its inverse. 
## The function shall be called has a constructor of a matrix for which the inverse needs to be calculated.
## The cacheSolve function will receive in input the special matrix returned by the makeCacheMatrix function.
## Usage exmaple: 
## > speMatr <- makeCacheMatrix()
## > speMatr$set(matrix(1:4,2,2))
## > speMatrInv <- cacheSolve(speMatr)


## Write a short comment describing this function
## The function provides the ability to: 
## set the value of the matrix
## get the value of the matrix
## set (cache) the value of the inverse of the matrix
## get the value of the inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {
  	    inv <- NULL
        set <- function(y) {
                x <<- y
                ## clear the cache
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) inv <<- solve  	    
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function
## The function provides the ability to calculate the inverse of the special
## matrix generated by the makeCacheMatrix function. If the inverse has already been calculated for
## the same matrix, the value will be taken from the cache of the special matrix.
## The function does not check if the matrix is invertible
cacheSolve <- function(x, ...) {

        ## Return a matrix that is the inverse of 'x'
	      inv <- x$getinverse()
	      ## check if a cached value exists
        if(!is.null(inv)) {
                message("getting cached data")
                ## return cache value without repeating calculation
                return(inv)
        }
        ## cache does not exist, calculate it
        data <- x$get()
        inv <- solve(data, ...)
        ## cache the inverse of the matrix
        x$setinverse(inv)
        inv
}
