︠3bcbe23a-8efb-427b-8934-8a7f37e1f99bs︠
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
︡7bd263e2-cbb8-4f79-822f-9caa114e0b15︡{"stdout":"[   -500.022000968043]\n[    433.019052838325]\n[   -866.038105676650]\n[2.08600078751633e-27]\n[    250.011000484021]\n[    749.988999515979]\n"}︡{"done":true}









