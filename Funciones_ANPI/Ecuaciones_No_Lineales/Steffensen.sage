#Steffensen implementacion en SageMath

import sys
from sage.all import *


#                     Método Steffensen
# Función que calcula la approximación del cero de una función ingresada 
# utilizando la impĺementación del método Steffensen

# Entradas: f -> es la función que se le van a approximar el cero
#           xk0 -> Es un valor inicial
#           tolerancia -> tolerancia acceptada para que acaben las iteraciones
#           iter_max -> Son la iteraciones máximas para calcular el cero de la funcion 
# Salidas: iteraciones -> cantidad de iteraciones que se necesitaron para llegar al resultado
#          Error -> error actual de la approximación
#          xk -> Resultado de la approximación

def steffensen_aux(f,xk0,tolerancia,iter_max):
    error = tolerancia+1   #Error en cada una de las iteraciones del método 
    n = 1           #Conteo de número de iteraciones del método
    numerador = 0   #Numerador de la división del método iterativo
    denominador = 0 #Denominador de la división del método iterativo
    xk1 = 0         #Puntos necesarios para el método iterativo 
    xk2 = 0          # se calculan por medio del xk0
    for n in range(1,iter_max) :
        xk1 = xk0 + f(xk0)
        xk2 = xk1 + f(xk1)
        numerador = pow((xk2 - xk1),2)
        denominador = (xk2 - (2*xk1) + xk0)
        xk = xk2 - numerador/denominador
        error = abs(f(xk))
        if error < tolerancia:
            print("Iteraciones %i"%n)
            print("Error %f"%error)
            return xk
        xk0 = xk
    print('Se llegó al numero de iteraciones máximas %f' %iter_max)
    return xk

def f(x):
    return (x*x)-(2*x)-56

def steffensen():
    xk0 = 0.7
    tolerancia = 10**-4
    iter_max = 10000
    xk = steffensen_aux(f,xk0,tolerancia,iter_max)
    print("Resultado: %f"%xk)
    #print("evaluación del resultado: %f"%f(-6.549831825767762))

steffensen()