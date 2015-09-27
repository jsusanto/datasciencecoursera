#makeCacheMatrix has 4 functions:
# set() - to set the matrix
# get() - to get the matrix
# set_matrix() - to set inverse matrix
# get_matrix() - to get the value of inverse matrix
makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
			x <<- y
			m <<- NULL
	}
	get <- function() x
	
	set_matrix <- function(solve) m <<- solve
	get_matrix <- function() m
	list(set = set, get = get,
		 set_matrix = set_matrix,
		 get_matrix = get_matrix)
}

# Example if we put x <- makeCacheMatrix ( [matrix] )
# this function will 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		m <- x$get_matrix()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$set_matrix(m)
        m
		
}