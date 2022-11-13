## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    i <- NULL
        
    ## Method to set the matrix
    set <- function( matrix ) {
            m <- matrix
            i <- NULL
    }

    ## Method the get the matrix
    get <- function() {
        m
    }

    ## Method to set the inverse of the matrix
    setInverse <- function(inverse) {
        i <- inverse
    }

    ## Method to get the inverse of the matrix
    getInverse <- function() {
        i
    }

    ## Return a list of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    
    ## Return a matrix that is the inverse of 'x'
    
    m <- x$getInverse()
 
    if( !is.null(m) ) {
            message("getting cached data")
            return(m)
    }

    ## Get the matrix from our object
    data <- x$get()

    ## Calculate the inverse
    m <- solve(data) %*% data

    ## Set the inverse
    x$setInverse(m)

    ## Return the matrix
    m
}

x <-matrix(c(4,3,-2,-1), nrow=2, ncol=2)
print(x)

cachetest <- makeCacheMatrix(x)
cachetest$get()

cacheInversa(cachetest)
