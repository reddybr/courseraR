## Put comments here that give an overall description of what your
## functions do

## Clearly based quite heavily on MakeVector function given as an example, and works similarly.

> makeCacheMatrix <- function(x = matrix()) {
     inv <- NULL
     set <- function(y) {
         x <<- y
         inv <<- NULL
     }
     get <- function() x
     setinv <- function(p) inv <<- p
     getinv <- function() inv
     list(set=set, get=get, 
          setinv=setinv, 
          getinv=getinv)
 }


## Again, based heavily on the example function. Checks whether it has been previously calculated
## and reuturns it if so. Otherwise, calculates it with setinv function.

> cacheSolve <- function(x, ...) {
     inv <- x$getinv()
     if(!is.null(inv)) {
         message("getting cached data")
         return(inv)
     }
     data <- x$get()
     inv <- solve(data)
     x$setinv(inv)
     inv
 }
        ## Return a matrix that is the inverse of 'x': Sample answers below
        
 ##> x=rbind(c(1,-1/3),c(-1/3,1))
 ##> m=makeCacheMatrix(x)
 ##> m$get()
 ##           [,1]       [,2]
 ##[1,]  1.0000000 -0.3333333
 ##[2,] -0.3333333  1.0000000
 
  ##trying out cacheSolve for the first time; successfully calculates inverse, no sign of cache
 
 ##> cacheSolve(m)
 ##      [,1]  [,2]
 ##[1,] 1.125 0.375
 ##[2,] 0.375 1.125
 
  ##this time "getting cached data" is printed, showing it worked
 
 ##> cacheSolve(m)
 ##getting cached data
 ##      [,1]  [,2]
 ##[1,] 1.125 0.375
 ##[2,] 0.375 1.125
 ##> 
