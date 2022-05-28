# Returns the diagonal matrix with every element inverted (1/x)
def getInvDiag(A):
    n = A.nrows()
    m = A.ncols()
    D = matrix(QQ, n, m)
    for i in range(n):
        for j in range(m):
            if i == j:
                D[i,j] = 1 / A[i,j]
    return D

#Returns diagonal matrix of A
def getDiag(A):
    n = A.nrows()
    m = A.ncols()
    D = matrix(QQ, n, m)
    for i in range(n):
        for j in range(m):
            if i == j:
                D[i,j] = A[i,j]
    return D

#Frobenius norm of x
def norm2(x):
	result = 0
	n = x.nrows()
	for i in range(n):
		result += x[i, 0]**2
	return sqrt(result)

def isSquareMatrix(A):
	rows = A.nrows()
	cols = A.ncols()
	return rows == cols

def jacobi(A, b, x0, iterMax, tol):
    if isSquareMatrix(A):
        if A.nrows() == b.nrows():
            D = getDiag(A)
            LpU = A - D
            invD = getInvDiag(A)
            z = invD * b
            M = -invD * LpU

            xk = x0
            for k in range(iterMax):
                xk = M * xk + z
                error = norm2(A * xk - b)
                if error < tol:
                    break
            
            return (xk, k, error)
        else:
            print("Inconsistent dimensions")
    else:
        print("Non-invertible matrix")


# Example to evaluate
A = matrix(QQ,[[5, 1, 0], [1, 5, 1], [0, 1, 5]])
b = matrix(QQ, [[6], [7], [6]])
x0 = matrix(QQ, [[0], [0], [0]])
iterMax = 1000
tol = 1e-10

print('--------------<Método de Jacobi>---------------')
print('A = ', A)
print('b = ', b)
print('x = ', x0)
print('iterMax = ', iterMax)
print('tol = ', tol)
print('_______________________________________________________')
xk, k, error = jacobi(A, b, x0, iterMax, tol)
print("Aproximación de la solución: \nxk = \n{}\nError = {}\nIteraciones realizadas = {}".format(xk.n(), error.n(), k))
