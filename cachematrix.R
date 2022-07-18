## Put comments here that give an overall description of what your
## functions do


## This function create a matrix which containing several functions
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL #Let m=NULL
    set <- function(y){
        x <<- y  #x=y,m=NULL after set(y)
        m <<- NULL
    }
    get <- function() x
    setmean <- function(mean) m <<- mean 
    getmean <- function() m
    list(set=set, get=get,
         setmean=setmean,
         getmean=getmean)
}


##This function is used for the inverse of the created matrix.
cacheSolve <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data,...)
    x$setmean(m)
    m
}
