def isSquareMatrix(A):
	rows = A.nrows()
	cols = A.ncols()
	return rows == cols

#Returns lower-triangular part of matrix (including diagonal)
def getLowerTriang(A):
	rows = A.nrows()
	cols = A.ncols()
	L = matrix(QQ, rows, cols)
	for i in range(rows):
		for j in range(cols):
			if j <= i:
				L[i,j] = A[i,j]
	return L

#Returns upper-triangular part of matrix
def getUpperTriang(A):
	rows = A.nrows()
	cols = A.ncols()
	U = matrix(QQ, rows, cols)
	for i in range(rows):
		for j in range(cols):
			if i < j:
				U[i,j] = A[i,j]
	return U

def sust_forward(A,b):
	m = b.nrows()
	x = matrix(QQ, m, 1)
	for i in range(m):
		aux = 0
		for j in range(i):
			aux += A[i,j]*x[j,0]
		x[i] = (1/A[i,i]) * (b[i, 0] - aux)
	return x

#Frobenius norm of x
def norm2(x):
	result = 0
	n = x.nrows()
	for i in range(n):
		result += x[i, 0]**2
	return sqrt(result)

def gauss_seidel(A, b, x0, iterMax, tol):
	if isSquareMatrix(A):
		if A.nrows() == b.nrows():
			LpD = getLowerTriang(A)
			U = getUpperTriang(A)
			y = sust_forward(LpD, b)

			xk = x0
			for k in range(iterMax):
				w = U * xk
				zk = sust_forward(LpD, w)
				xk = -zk + y
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

print('--------------<Método de Gauss-Seidel>---------------')
print('A = ', A)
print('b = ', b)
print('x = ', x0)
print('iterMax = ', iterMax)
print('tol = ', tol)
print('_______________________________________________________')
xk, k, error = gauss_seidel(A, b, x0, iterMax, tol)
print("Aproximación de la solución: \nxk = \n{}\nError = {}\nIteraciones realizadas = {}".format(xk.n(), error.n(), k))
