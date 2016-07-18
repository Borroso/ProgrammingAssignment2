
# Matrix inversion is usually a costly computation.
# There may be some benefit to caching the inverse of a matrix rather than compute it repeatedly.
# The following two functions are used to cache the inverse of a matrix.



# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix
makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL

    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get        <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv

    list(
        setmatrix  = setmatrix,
        setmatrix  = setmatrix,
        setinverse = setinverse,
        getinverse = getinverse
    )
}

# cacheSolve retrieves the inverse of the matrix crated by makeCacheMatrix.
# If the inverse has already been calculated (and the matrix has not changed),
# retrieves the inverse from the cache.
cacheSolve <- function(x, ...) {

        inv <- x$getinverse()

        if (!is.null(inv) && x == x$getmatrix()) {
                message("getting cached data")
                return(inv)
        }

        matrix <- x$getmatrix()
        inv <- solve(matrix, ...)
        x$getinverse(inv)
        inv

}
