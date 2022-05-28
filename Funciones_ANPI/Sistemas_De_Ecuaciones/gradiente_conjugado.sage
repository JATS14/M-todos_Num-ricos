#Gradiente Conjugado implementacion en SageMath

import sys
from sage.all import *
import numpy as np

#                     Método Gradiente Conjugado
# 
# Utilizando la impĺementación del método Gradiente Conjugado para resolver un sistema de 
# ecuaciones lineas

# Entradas:A -> Matriz a la que le se quiere obtener la solución
#          b -> valores por los que se multiplica la matriz A 
#          x0 -> Es un valor inicial
#          tolerancia -> tolerancia acceptada para que acaben las iteraciones
#          iter_max -> Son la iteraciones máximas para calcular el cero de la funcion 

# Salidas: iteraciones -> cantidad de iteraciones que se necesitaron para llegar al resultado
#          Error -> error actual de la approximación
#          xk -> Resultado de la approximación

def gradiente_conjugado_aux(A,b,x0,tolerancia,iter_max):
    error = tolerancia+1           #Error en cada una de las iteraciones del método 
    n = 0                          #Cantidad de iteraciones de la aproximacion
    xk = x0                         
    rk = np.dot(A, xk) - b         #Obtenemos el valor actual de solucion de la matriz
    pk = -rk                       #Negativo de la matriz rk

    for n in range(0,iter_max) :
        apk = np.dot(A, pk)            #Valor de la matriz A por la matriz pk
        rkrk = np.dot(rk, rk)          #El valor de rk cuadrado
        
        alpha = rkrk / np.dot(pk, apk) # Se calcula valor multiplicadir
        xk = xk + alpha * pk           # se calcula el nuevo xk

        rk = rk + alpha * apk          # Se calculan valores necesarios para la siguiente iteracion
        beta = np.dot(rk, rk) / rkrk   
        pk = -rk + beta * pk           
        
        rk_norm = np.linalg.norm(rk)   #Se calcula la norma del valor actual de la solución

        if rk_norm < tolerancia:      #Revisamos si se terminó la ejecución
            return [n,rk_norm,xk]
    return [n,rk_norm,xk]
        


def gradiente_conjugado():
    A = [[0.7444,-0.5055,-0.0851],[-0.5055,3.4858,0.0572],[-0.0851,-0.0851,0.4738]]
    b = [-0.0043,2.2501,0.2798]
    x0 = [3,1,-7]

    tolerancia = 1e-5
    iter_max = 10000

    x = gradiente_conjugado_aux(A,b,x0,tolerancia,iter_max)
    print("Iteraciones %i"%x[0])
    print("Error %f"%x[1])
    print("Solucion: \n",x[2])

gradiente_conjugado()
