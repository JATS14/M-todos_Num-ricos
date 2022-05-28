︠b54c959f-0815-4d40-b396-e6d27f41b266s︠
#Metodo para resolver sistemas de ecuaciones tridiagonales mediante el metodo de thomas
#Entradas: A sistema de eciaciones, d igualdades del sistema de ecuaciones
#Salidas: x vector solucion del sistema de ecuaciones
def thomas(A,d):
    #Se verifica que la matriz sea tridiagonal
    if (A.nrows() != A.ncols() or A.nrows() < 3 or A.ncols() < 3):
        print("La matriz debe ser tridiagonal")
        return 0
    m = len(A[0])
    n = 0
    a = [0] #Vector con los valores de an considerando a0 = 0
    b = [] #Vector con los valores de bn
    c = [] #Vector con los valores de cn
    p = [] #Vector con los valores de pn
    q = [] #Vector con los valores de qn
    x = [] #Vector con los valores de xn
    # Se obtienen los valores de a de la diagonal inferior
    while n < m-1:
        a.append(A[n+1,n])
        n = n+1
    n = 0
    # Se obtienen los valores de b de la diagonal principal
    while n < m:
        b.append(A[n,n])
        n = n+1
    n = 0
    # Se obtienen los valores de c de la diagonal superior
    while n < m-1:
        c.append(A[n,n+1])
        n = n+1
    c.append(0) #cn = 0
    n = 0
    # Se calculan los valores de pn segun la formula desde 0 hasta m-1
    while n < m-1:
        if n == 0:
            p.append(c[n]/b[n])
        if n > 0:
            p.append(c[n]/(b[n]-p[n-1]*a[n]))
        n = n+1
    n = 0
    # Se calculan los valores de qn segun la formula desde 0 hasta m
    while n < m:
        if n == 0: #Se obtiene el primer valor segun la formula
            q.append(d[n]/b[n])
        if n > 0: #Se calculan los demas valores segun la formual
            q.append((d[n]-q[n-1]*a[n])/(b[n]-p[n-1]*a[n]))
        n = n+1
    n = m-1
    # Se calculan los valores de x segun la formual
    while n >= 0:
        if n == m-1: #Se da xn = qn
            x.append(q[n])
        if n < m-1: #Se calculan los demas valores segun la formula de forma descendente
            x.append(q[n]-p[n]*x[-1])
        n = n-1
    x = x[::-1] #Se da vuelta a la lista para tener el orden correcto
    return x




︡92e25837-c386-4f82-a71f-1779ec04ccd1︡{"done":true}










