#Sistema de ecuaciones 
#resultado del planteaminto del problema
A = matrix([[0.866,0,-0.5,0,0,0],
            [0.5,0,0.866,0,0,0],
            [-0.866,-1,0,-1,0,0],
            [-0.5,0,0,0,-1,0],
            [0,1,0.5,0,0,0],
            [0,0,-0.866,0,0,-1]])
#Resultados esperados para el sistema de ecuaciones
#resultado del planteaminto del problema
b = matrix([[0,-1000,0,0,0,0]]).T

def pinversa(A, b, itermax, tol):
    X = (1/(norm(A)**2))*(transpose(A))
    xk = X * b
    m = len(A[0])
    I = identity_matrix(m)
    k = 0
    I = 2*I
    error = tol + 1
    while k < itermax and error > tol:
        X = X*(I-A*X)
        xkn = X * b
        error = norm(xkn - xk) / norm(xkn)
        xk = xkn
        k += 1
    return xk


#El primer valor de xk es F1
#El segundo valor de xk es F2
#El tercer valor de xk es F3
#El cuarto valor de xk es H2
#El quinto valor de xk es V2
#El sexto valor de xk es V3

pinversa(A,b,500,1*10**-10)









