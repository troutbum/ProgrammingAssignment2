## R Programming - April 2014
## Programming Assignment 2 - Caching the Inverse of a Matrix
## 

# In this example we introduce the <<- operator which can be used to assign a
# value to an object in an environment that is different from the current
# environment. 

# Below are two functions that are used to create a special object
# that stores a matrix and cache's its inverse.
# 
# The first function, makeVector creates a special "vector", which is really a
# list containing a function to:
# - set the matrix
# - get matrix
# - set matrix inverse
# - get matrix inverse


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


# The second function calculates the inverse of the object. It checks to see if the inverse
# has already been calculated. Ff not, it calculates the inverse and stores it
# in the object.  Returns a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        
        inverse <- x$getInverse()               # retrieve cached inverse
        if(!is.na(inverse[1,1])) {              # if not empty, return cached inverse       
                message("getting cached inverse matrix")
                
                return(inverse)                 # use invisible(inverse) to suppress print()
        }
        data <- x$get()                         # otherwise get cached data
        inverse <- solve(data, ...)             # calculate the inverse
        x$setInverse(inverse)                   # save the inverse into cache
        inverse
        
}

# Now use these functions to generate an inverse matrix and cache it. Verify that
# the calculated and cached inverses are identical Verify that the matrix
# multiplied by its inverse is equal to the identity matrix

size <- 10                                       # create test data (square matrix)
mydata <- matrix(rnorm(size*size), size, size)

mat <- makeCacheMatrix()                         # create caching data structure 
mat

mat$set(mydata)                                  # place data into structure
mat$getInverse()                                 # get inverse (empty at this point)
imat <- cacheSolve(mat)                          # calculate the inverse
imat_cached <- cacheSolve(mat)                   # caculate the inverse again (retrieved cached value)

identical(imat, imat_cached)                     # verify inverse and cached inversed are the same
test <- mydata %*% imat                          # verify matrix %*% inverse = identity matrix
