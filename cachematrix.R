## Put comments here that give an overall description of what your
## functions do

## function to create an object for 
## caching a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        inverse <- NULL                         # set inverse matrix to NULL
        set <- function(y) {                    # method to store data matrix
                x <<- y
                inverse <<- NULL
        }
        get <- function() x                     # method to retrieve data matrix
        setInverse <- function(inverse) invCached <<- inverse    # method to store mean
        getInverse <- function() invCached                 # method to retrieve mean
        
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

# function to calculate the inverse of the object.
# checks to see if the inverse has already been calculated. 
# if not, it calculates the inverse and stores it in the object 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        m <- x$getmean()                        # retrieve cached mean
        if(!is.null(m)) {                       # if it exists
                message("getting cached data")
                return(m)
        }
        data <- x$get()                         # otherwise get cached data
        m <- mean(data, ...)                    # calculate the mean
        x$setmean(m)                            # save the mean into cache
        m
        
}
