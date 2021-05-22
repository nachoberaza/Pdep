module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

tuplaDePrueba=('a','b','c')
tuplaDeTest=(1,3,2,4)

-- Ejercicio 1 --
fst3 ( n , _ , _ ) = n
snd3 ( _ , n , _ ) = n
trd3 ( _ , _ , n ) = n


-- Ejercicio 2 --
invertirOrden num func = func num

aplicar tuplaDeFunc num = (map.invertirOrden) num tuplaDeFunc 

-- aplicarFunciones listaFunc num = map (aplicar num) listaFunc
-- map (*2) [3,4,7]
