makeCacheMatrix <- function(x = matrix()) {
  #inv is set to NULL, making it an object in the makeCacheMatrix environment
  
  inv <- NULL
  # Set function assigns the input argument to x in the parent environment
  # Clears the value of inv that was cached before
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  # We get x from the parent environment
  get <- function() x
  
  # get and set for getting the inv variable from the parent environment
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  
  # Create a list containing the set, get, setinv and getinv functions
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


cacheSolve <- function(x, ...) {

  inv <- x$getinv()
  
  # Logical operator for testing whether inverse_matrix is NULL or not.
  # If not NULL, it contains an inv value
  # If NULL, the function proceeds
  
  if(!is.null(inv)) {
    message("getting cached data")
    return(m)
  }
  
  #Get the value of x
  data <- x$get()
  # Perform solve() function
  inv <- solve(data, ...)
  
  # Caches the value by using the setinv function from makeCacheMatrix
  x$setinv(inv)
  
  # Returns the inv value
  inv
}
