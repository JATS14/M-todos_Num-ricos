#--------------------
#Método de bisección
#--------------------
#
#Entradas:
#    <f> - función a aproximar el cero
#    <a> - límite inferior del intervalo
#    <b> - límite superior del intervalo
#    <tol> - tolerancia
#    <iter_max> - Iteraciones máximas para realizar el cálculo
#
#Salidas:
#    <iter> - Cantidad de iteraciones usadas para llegar al resultado
#    <error> - Error de la aproximación de la solución
#    <xk> - Resultado de la aproximación de la solución

def biseccion(f, a, b, epsi, iterMax):
    try:
        #Esto es para hacer las evaluaciones de la función f
        f = f._fast_float_(f.variables()[0])
    except AttributeError:
        pass
    #Este es el intervalo en el que vamos a calcular la aprox. de la solución
    intervalo = [(a,b)]
    #inicializamos variables para la operación en las iteraciones
    dos = float(2)
    epsi = float(epsi)
    iteraciones = int(0)
    #Inicio de la iteración
    while True:
        xk= (a+b)/dos
        fa = f(a) 
        fb = f(b) 
        fxk = f(xk)
        iteraciones = iteraciones + 1
        if iteraciones <= iterMax: #Buscamos que no se pase del número máximo de iteraciones
            if abs(fxk) < epsi: #Condición de parada
                return xk, intervalo, abs(fxk), iteraciones
            #Hacemos los cambios necesarios del intervalo para la siguiente iteración
            if fa*fxk < 0:
                a, b = a, xk
            elif fxk*fb < 0:
                a, b = xk, b
            else:
                raise ValueError("la función debe tener un cambio de signo en el intervalo proporcionado")
        else:
                raise ValueError("Se llegó al máximo número de iteraciones")

#Ejemplo para prueba
fu = "sin(x) - 1/x"
f = lambda x: sin(x) - 1/x
a1 = 1
b1 = 1.5
ep = 0.005
iter_max = 100
xk, intervalo, error, itera = biseccion(f, a1, b1, ep, iter_max)
print("Aproximación del cero de la función: f(x) =", fu)
print("Para el intervalo = [", intervalo[0][0], ",", intervalo[0][1], "]")
print("\nAproximación de la solución: xk = {}\nError = {}\nIteraciones = {}".format(xk, error, itera))




