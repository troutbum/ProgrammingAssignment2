# R Programming - April 2014
# Programming Assignment 2 - Caching the Inverse of a Matrix

makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}


x <- matrix(1:100, 20, 5)
m1 <- makeVector(x)
m1$get()
m1$getmean()
m1$set()
m1$set(x)
m1$get
m1$get()
m1$getmean()
m1$getmean
m2 <- makeVector()
m2$getmean
m2$getmean()
s <- matrix(1:25,5,5)
s
solve(s)
s <- matrix(rep(25),5,5)
solve(s)
s <- matrix(rep(rand()),5,5)
s <-matrix(rep(rnorm()),5,5)
s <-matrix(rnorm(),5,5)
s <-matrix(rnorm(25),5,5)
View(s)
solve(s)
s
t <- s
identical(s,t)
identical(s,t)
v <- solve(s)
identical(s,v)

