module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

-- Aplicacion parcial --

-- Ejercicio 1 --
siguiente :: Number -> Number
siguiente n = (+ 1) n

-- Ejercicio 2 --
mitad :: Number -> Number
mitad n = (* 0.5) n

-- Ejercicio 3 --
inversa :: Number -> Number
inversa n = (1/) n

-- Ejercicio 4 --
triple :: Number -> Number
triple n = (* 3) n

-- Ejercicio 5 --
esNumeroPositivo :: Number -> Bool
esNumeroPositivo n = ( > 0) n

-- Composicion --

-- Ejercicio 6 --
esMultiploDe :: Number -> Number -> Bool
esMultiploDe n m = ( (== 0).(mod n) ) m

-- Ejercicio 7 --
-- Falta

-- Ejercicio 8 --
inversaRaizCuadrada = (inversa.sqrt)

-- Ejercicio 9 --
incrementaMCuadradoN m n = (+ (m^2)) n --(m^2) + n

-- Ejercicio 10 --
esResultadoPar n m = ((even).(^m)) n