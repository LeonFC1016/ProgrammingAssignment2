## These functions used together will be able to cache a matrix and its 
## inverse, calculate the inverse, and retrieve the data when called on again


## This function has to be used inside the cacheSolve function, but it can be stored prior as a variable to be called on inside the cacheSolve function. This function contains setter and getter functions for the matrix and its inverse. It uses the list to allow cacheSolve to access makeCacheMatrix's setter and getter functions. It also resets the matrix and its inverse when new matrixes are inputted.

makeCacheMatrix <- function(x = matrix()) {
i <- NULL
	setMatrix <- function(y){
		x<<-y
		i <<- NULL
	}
	getMatrix <- function() x
	setInverse <- function(inverse) i <<- inverse
	getInverse <- function() i
	list(setMatrix = setMatrix, 
		getMatrix = getMatrix, 
		setInverse = setInverse, 
		getInverse = getInverse)
}


## This function uses the list function to retrieve a stored inverse. If there is no stored inverse, it uses the list function to call on the getter, getMatrix, to retrieve the matrix, then uses the solve function to calculate its inverse, then it takes that value and assigns it to the setter function, setInverse, then returns the inverse matrix.

cacheSolve <- function(x, ...) {
		i <- x$getInverse()
	if(!is.null(i)){
		message("getting cached data")
		return(i)
	}
	data <- x$getMatrix()
	i <- solve(data)
	x$setInverse(i)
	i
}
