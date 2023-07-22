module Basicos where
import PdePreludat

esMultiploDe :: Number -> Number -> Bool
esMultiploDe n1 n2 = mod n1 n2 == 0

cubo :: Number -> Number
cubo n = n**3

areaTriangulo :: Number -> Number -> Number
areaTriangulo base altura = base * altura * 0.5

esBisiesto :: Number -> Bool
esBisiesto anio = (esMultiploDe anio 400 || esMultiploDe anio 4) && not(esMultiploDe anio 100)

celsiusToFahr :: Number -> Number
celsiusToFahr cels = ( cels * 9/5 ) + 32

fahrToCelsius :: Number -> Number
fahrToCelsius fahr = (fahr - 32) * (5/9)

haceFrio :: Number -> Bool
haceFrio tempF = fahrToCelsius tempF < 8

mcd :: Number -> Number -> Number
mcd = gcd

mcm :: Number -> Number -> Number
mcm n1 n2 = n1 * n2 / mcd n1 n2

minOf3 :: Number -> Number -> Number -> Number
minOf3 n1 n2 n3 = min n1 (min n2 n3)

maxOf3 :: Number -> Number -> Number -> Number
maxOf3 n1 n2 n3 = max n1 (max n2 n3)

dispersion :: Number -> Number -> Number -> Number
dispersion m1 m2 m3 = maxOf3 m1 m2 m3 - minOf3 m1 m2 m3

tiposDeDias :: Number -> Number -> Number -> String
tiposDeDias d1 d2 d3 
    | 30 > dispersion d1 d2 d3 = "Dias parejos"
    | 100 < dispersion d1 d2 d3 = "Dias locos"
    | otherwise = "Dias normales"

pesoPino :: Number -> Number
pesoPino altura
  | altura < 300 = altura * 3
  | otherwise = porTres + porDos
  where 
    porTres = 3 * 300
    porDos = 2 * ultimosMts
    ultimosMts = altura - 300

esPesoUtil :: Number -> Bool
esPesoUtil peso = (peso > 400) && (peso < 1000)

sirvePino :: Number -> Bool
sirvePino = esPesoUtil.pesoPino

--esCuadradoPerfecto :: Number -> Bool

{-
  0 --> 1 --> 4 --> 9 --> 16 --> 25 --> 36 --> ... 

  ej: 16 --> 9 --> 4 --> 1 --> 0  ==>  n - (n/2 - 1)
          7     5     3     1     ==> (2n-1)
-}

cuadradoDelAnterior n = (n-1) ** 2

esCuadradoPerfecto 0 = True
esCuadradoPerfecto n = esCuadradoPerfecto (n)