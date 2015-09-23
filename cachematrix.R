## Put comments here that give an overall description of what your
## functions do

## Identical to the example makeVector except a matrix is used instead of a vector 
## and the inverse is calculated instead of the mean. Its job is to set and get 
## the value of the matrix then set and get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}

## Checks to see if the inverse for a selected matrix is already saved and if it is, returns it
## otherwise it calculates it and returns it

cacheSolve <- function(x, ...) {
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
