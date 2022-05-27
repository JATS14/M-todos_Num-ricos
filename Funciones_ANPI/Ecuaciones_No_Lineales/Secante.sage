#--------------------
#Método de secante
#--------------------
#
#Entradas:
#    <f> - función a aproximar el cero
#    <xk0> - valor inicial de iteración 0
#    <xk1> - valor inicial de iteración 1
#    <tol> - tolerancia
#    <iter_max> - Iteraciones máximas para realizar el cálculo
#
#Salidas:
#    <iter> - Cantidad de iteraciones usadas para llegar al resultado
#    <error> - Error de la aproximación de la solución
#    <xk> - Resultado de la aproximación de la solución

def printSecant(f, xk0, xk1, iterMax, epsi ):
    #encabezado de tabla junto con los valores iniciales
    print ('#','\t', 'xi', '\t\t\t','error')
    print('_______________________________________________________')
    print (0, '\t', xk0, '\t\t\t', abs(f(xk0)))
    print (1, '\t', xk1, '\t\t\t', abs(f(xk1)))

    #Comprobación para evitar divisiones entre cero
    if ((f(xk1)-f(xk0))==0):
        print('Error: no se puede aproximar la solución')
        return None
    else:
        #Se realiza la primera iteración e inicializamos el x_k e iteraciones
        xk2 = xk1-((xk1-xk0)*f(xk1)/(f(xk1)-f(xk0)))
        iteraciones = 1
        #Entramos al loop hasta que se alcancen las iteraciones máximas
        #o se llegue a un error más pequeño que la tolerancia
        while( iteraciones<iterMax and abs(f(xk2))>epsi ) :
            #actualizamos las iteraciones
            iteraciones = iteraciones + 1
            print("{}\t{}\t{}".format(iteraciones, xk2.n(), abs(f(xk2)).n()))
            #actualizamos los valores de x_k y x_k-1
            xk0=xk1
            xk1=xk2
            #Generamos el nuevo valor de x_k
            xk2 = xk1-((xk1-xk0)*f(xk1)/(f(xk1)-f(xk0)))
        if( abs(f(xk2))<= epsi ) :
            #Imprimimos valores de la tabla y retornamos los valores de salida
            print("{}\t{}\t{}".format(iteraciones+1, xk2.n(), abs(f(xk2)).n()))
            print('_______________________________________________________')
            return xk2, abs(f(xk2)), iteraciones+1
        elif (iteraciones<iterMax):
            print ('Se llegó al máximo número de iteraciones')

#----Definimos los valores de entrada-----
#función
var('x')
f(x)= x^2-35
#valores x0 y x1
x0 = 5
x1 = 6
#cantidad máxima de iteraciones
iterMax = 100
#tolerancia
tol = 0.000000001

print('--------------<Método de la secante>---------------')
print('Aproximación de la solución para la función: ')
print('f(x)=', f(x))
print('Usando como valores iniciales:')
print('x0 = {}\nx1 = {}'.format(x0, x1))
print('_______________________________________________________')
xk, error, itera = printSecant(f, x0, x1, iterMax, tol)
print("Aproximación de la solución: xk = {}\nError = {}\nIteraciones realizadas = {}".format(xk.n(), error.n(), itera))
