## Put comments here that give an overall description of what your
## functions do

## Function to create an object for 
## caching a matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
        
        invCached <- matrix(data = NA, nrow = 1,                # set cached inverse matrix to "empty"
                          ncol = 1, byrow = FALSE,
                          dimnames = NULL)
        
        set <- function(y) {                                    # method to store data matrix
                x <<- y
                invCached <<- matrix(NA, 1, 1, FALSE, NULL)     # reset cached inverse to "empty"
        }
        get <- function() x                                     # method to retrieve data matrix
        setInverse <- function(inverse) invCached <<- inverse   # method to store mean
        getInverse <- function() invCached                      # method to retrieve mean
        
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

# Function to calculate the inverse of the object.
# checks to see if the inverse has already been calculated. 
# if not, it calculates the inverse and stores it in the object 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        inverse <- x$getInverse()               # retrieve cached inverse
        if(!is.na(inverse[1,1])) {              # if not empty, return cached inverse       
                message("getting cached 
                        inverse matrix")
                return(inverse)                 # use invisible(inverse) to suppress print()
        }
        data <- x$get()                         # otherwise get cached data
        inverse <- solve(data, ...)             # calculate the inverse
        x$setInverse(inverse)                   # save the inverse into cache
        inverse
        
}

# use functions to generate inverse matrix

size <- 10                                   # create data (square matrix)
mydata <- matrix(rnorm(size*size), size, size)

M1 <- makeCacheMatrix()                         # create caching data structure 
M1
environment(M1)

M1$set(mydata)                                  # place data into structure
M1$getInverse()                                 # get inverse (empty at this point)
imat <- cacheSolve(M1)                          # calculate the inverse
imat_cached <- cacheSolve(M1)                   # caculate the inverse again (retrieved cached value)

identical(imat, imat_cached)                    # verify inverse and cached inversed are the same
test <- mydata %*% imat                         # verify matrix %*% inverse = identity matrix
