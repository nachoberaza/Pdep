module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero


-- Ejercicio 1 --
tuplaDePrueba=('a','b','c')

fst3 ( n , _ , _ ) = n
snd3 ( _ , n , _ ) = n
trd3 ( _ , _ , n ) = n


-- Ejercicio 2 --
tuplaDeTest=((*2))--,(*3))


applicarOperacion num func = func num

aplicar tuplaDeFunc num = map (applicarOperacion num tuplaDeFunc) 

-- aplicarFunciones listaFunc num = map (aplicar num) listaFunc
-- map (*2) [3,4,7]


-- Ejercicio 3 --

-- funciones auxiliares
--sumaDeElementos tupla =  
primeroMayor tupla = fst tupla > snd tupla

cuentaBizarra tuplaEntrada
    | primeroMayor tuplaEntrada = ((+ snd tuplaEntrada).)fst tuplaEntrada





--- EXPRESIONES LAMBDA ---

data Persona =
   Persona{
       nombre :: String,
       edad :: Number
   }deriving Show

personaTest = Persona{ nombre="Nacho", edad=5 }
personaTest1 = Persona{ nombre="Exe", edad=45 }
personaTest2 = Persona{ nombre="Bauti", edad=8 }
personaTest3 = Persona{ nombre="Marce", edad=58 }
personaTest4 = Persona{ nombre="Justo", edad=59 }

listaPersonas=[ personaTest,personaTest1,personaTest2,personaTest3,personaTest4 ]

-- puramente una expresion lambda --
mayoresDeEdad personas =
 filter(\ personas -> edad personas >= 18) personas

sumaEdades personas =
    foldl (\ total personas -> edad personas + total) 0 personas

siguiente = \x -> x+1

-- DEFINICION LOCAL --

-- Funcion similar a la anterior pero implementada con definicion local --
mayoresDeEdad2 personas = 
    filter mayoresDeEdad personas
    where mayoresDeEdad persona = edad persona >= 18

numeroDeRaices a b c
    | discriminante > 0 = 2
    | discriminante == 0 = 1
    | discriminante < 0 = 0
    where discriminante = b*b - 4*a*c

-- CURRIFICACION --

-- curry :: ((a,b) -> c )  ->  a -> b -> c
-- curry f x y = f(x,y)

-- uncurry a -> b -> c  ->  (a,b) -> c
-- uncurry f (x,y) = (a,b)

-- suma con currificacion   suma a b = a+b
suma :: Number -> Number -> Number
suma = \a -> (\b -> a+b)

l1=[2,3,4]
l2=[5,6,7]

-- multiplicacion de elementos correspondientes de dos listas (x1*y1, x2*y2, ...)
multiplicaciones xs ys = map (uncurry (*)) $ zip xs ys
