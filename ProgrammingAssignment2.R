# R Programming - April 2014
# Programming Assignment 2 - Caching the Inverse of a Matrix

# Example: Caching the Mean of a Vector
# 
# In this example we introduce the <<- operator which can be used to assign a
# value to an object in an environment that is different from the current
# environment. Below are two functions that are used to create a special object
# that stores a numeric vector and cache's its mean.
# 
# The first function, makeVector creates a special "vector", which is really a
# list containing a function to:
# - set the value of the vector
# - get the value of the vector
# - set the value of the mean
# - get the value of the mean


makeVector <- function(x = numeric()) {         # cached data structure
        m <- NULL                               # set mean to NULL
        set <- function(y) {                    # method to store data
                x <<- y
                m <<- NULL
        }
        get <- function() x                     # method to retrieve data
        setmean <- function(mean) m <<- mean    # method to store mean
        getmean <- function() m                 # method to retrieve mean
        
        list(set = set, get = get, setmean = setmean, getmean = getmean)
}

# The following function calculates the mean of the special "vector" created
# with the above function. However, it first checks to see if the mean has
# already been calculated. If so, it gets the mean from the cache and skips the
# computation. Otherwise, it calculates the mean of the data and sets the value
# of the mean in the cache via the setmean function.


cachemean <- function(x, ...) {
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


# use professor's functions to calculate mean of a vector

size <- 500                           # create data (square matrix)
mydata <- matrix(rnorm(size*size), size, size)

m1 <- makeVector()                      # create caching data structure 
m1$set(mydata)                          # place data into structure
#m1$get()                                # show contents
m1$getmean()                            # get the mean (none at this point)
cachemean(m1)                           # calculate the mean
cachemean(m1)                           # caculate the mean again (retrieved cached value)
