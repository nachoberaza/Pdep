module Library where
import PdePreludat

--doble :: Number -> Number
doble numero = numero*2

--- Funciones basicas desarrolladas ---

-- Ejercicio 1 --
esMultiploDeTres nro = mod nro 3 == 0

-- Ejercicio 2 --
esMultiploDe nro1 nro2 = mod nro2 nro1 == 0

-- Ejercicio 3 --
cubo nro = nro**3

-- Ejercicio 4 --
area base altura = base * altura

-- Ejercicio 5 --

-- Con guardas --

--esBisiesto anio
-- | esMultiploDe anio 400 = True
-- | esMultiploDe anio 100 = False
-- | esMultiploDe anio 4 = True
-- | otherwise = False

-- Sin guardas --
esBisiesto anio = esMultiploDe anio 400 == True || esMultiploDe anio 100 == False || esMultiploDe anio 4 == True || otherwise == False

-- Ejercicio 6 --
celsiusToFahr grados = (grados * 9/5 ) + 32

-- Ejercicio 7 --
fahrToCelsius grados = (grados - 32) * 5/9

-- Ejercicio 8 --
haceFrioF grados = fahrToCelsius grados < 8

-- Ejercicio 9 --
mcd x 0 = x
mcd x y = mcd y (mod x y)

mcm nro1 nro2 = (nro1 * nro2) / mcd nro1 nro2

-- Ejercicio 10 -- 

-- Retornan el minimo y maximo de 3 numeros ingresados segun corresponda --
minOf3 n1 n2 n3 = min n1 (min n2 n3)
maxOf3 n1 n2 n3 = max n1 (max n2 n3)

dispersion m1 m2 m3 = (maxOf3 m1 m2 m3) - (minOf3 m1 m2 m3) 

tiposDeDias :: Number -> Number -> Number -> String
tiposDeDias d1 d2 d3 
    | 30 > (dispersion d1 d2 d3) = "Dias parejos"
    | 100 < (dispersion d1 d2 d3) = "Dias locos"
    | otherwise = "Dias normales"

--------------------------------- Definicion y modelado de datos ----------------------------

data Persona = 
    Persona{
        nombre :: String,
        edad :: Number
    }deriving Show

--cumplioAnios :: Persona -> Number
--cumplioAnios p 
--p = { edad = (edad p + 1) }

-- Calculo del factorial --
factorial 0 = 1
factorial n = n * factorial (n-1)

-- Sucesion de fibonacci --
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci(n-2)

-- Calculo combinatoria --
combinatoria m n = (factorial m) / ( (factorial n) * ( factorial (m-n) ) )




---------------------------------------------------------------------------
