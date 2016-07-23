setwd(getSrcDirectory(function(x) {x}))
source("cachematrix.R")

test = function(matrix){

        mat = makeCacheMatrix(matrix)

        start.time = Sys.time()
        cacheSolve(mat)
        duration = Sys.time() - start.time
        print(duration)

        start.time = Sys.time()
        cacheSolve(mat)
        duration = Sys.time() - start.time
        print(duration)

}

set.seed(1)
r = rnorm(10000)
matrix = matrix(r, nrow=100, ncol=100)
test <- test(matrix)
test
