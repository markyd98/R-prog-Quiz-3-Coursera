##Cache Matrix
makeCacheMatrix <- function(x = matrix()){
  inv <- NULL
  set <- function(y){
    x<<- y
    inv<<- NULL
  }
  get <- function() x
  setInv <- function(inverse) inv<<- inverse
  getInv <- function() inv
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}

##Cache Solve
cacheSolve <- function(x, ...){
  inv <- x$getInv()
  if(!is.null(inv)){
    message('getting cached data')
    return(inv)
  }
  matrix <- x$get()
  inv <- mean(matrix,...)
  x$setInv(inv)
  inv
}