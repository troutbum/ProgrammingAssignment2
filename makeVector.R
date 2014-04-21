makeVector <- function(x = numeric()) {
        #m <- NULL
        set <- function(y) {
                x <<- y
            #    m <<- NULL
                m <<- mean(x) 
        }
        get <- function() x
        
        setmean <- function()  print("foo")
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}


