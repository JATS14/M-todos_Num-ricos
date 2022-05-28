︠
#Definición de función principal

#                     Método Newthon Raphson
# Función que calcula la approximación del cero de una función ingresada
# utilizando la impĺementación del método de Newthon Raphson

# Entradas: f -> es la función que se le van a approximar el cero
#           xn -> Es un valor inicial
#           error (tolerancia) -> tolerancia acceptada para que acaben las iteraciones
#           iter_max -> Son la iteraciones máximas para calcular el cero de la funcion
# Salidas: iteraciones -> cantidad de iteraciones que se necesitaron para llegar al resultado
#          Error -> error actual de la approximación
#          xk -> Resultado de la approximación

def newthonRaphson(xn, error, iter_max):
    x = var('x')

    f(x) = x^3 - 3*x - 5 #Función 'quemada' de prueba

    fp = diff(f,x) #Derivada de función

    NewtonIteration(x) = x - (f/fp)(x) #fórmula de Newton

    #Variables para cálculo de error
    limit = 1
    raiz = [ ]
    raiz.insert(0,0)
    i=0
    counter = 0
    print(xn);
    while (abs(limit) > error) and (counter < iter_max): #Condición de parada: error menor a tolerancia definida
        xn = N(NewtonIteration(xn),digits=20)
        raiz.append(xn)
        i=i+1
        limit=(raiz[i]-raiz[i-1])/raiz[i] #Calculo de error
        counter+=1
    print('Se llegó al numero de iteraciones máximas %f' %counter)
    print('Se llegó al error =', abs(limit).n())
    print('Resultado de aproximación =', xn.n())
    return xn

#Ejemplo
print('Prueba\n')
newthonRaphson(4, 0.0000001, 100)
