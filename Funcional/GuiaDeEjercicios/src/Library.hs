module Library where
import PdePreludat

--doble :: Number -> Number
doble numero = numero*2

--- Funciones basicas desarrolladas ---

-- Ejercicio 1 --
esMultiploDeTres nro = mod nro 3 == 0

-- Ejercicio 2 --
esMultiploDe nro1 nro2 = mod nro1 nro2 == 0

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

--dispersion m1 m2 m3
--  | m1 < m2 < m3 = m1-m2
--  | m2< m3 < m1
--  | m3< m2 < m1
--  | m1 < m3 < m2
--  | m3 < m1 < m2

dame nro1 nro2 nro3 = min nro3 min nro1 nro2 