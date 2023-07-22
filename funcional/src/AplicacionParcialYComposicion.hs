module AplicacionParcialYComposicion where
import PdePreludat

-- Aplicacion parcial --

siguiente :: Number -> Number
siguiente  = (1+)

mitad :: Number -> Number
mitad = (0.5*)

inversa :: Number -> Number
inversa = (1/)

triple :: Number -> Number
triple = (3*)

esNumeroPositivo :: Number -> Bool
esNumeroPositivo = (0<) 

-- Composicion --

esMultiploDe :: Number -> Number -> Bool
esMultiploDe n m = ((0==).(mod n)) m

esBisiesto :: Number -> Bool
esBisiesto anio = multiplo4o400 && (not.esMultiploDe anio) 100
  where
    multiplo4o400 = (esMultiploDe anio 400 || esMultiploDe anio 4)

inversaRaizCuadrada :: Number -> Number
inversaRaizCuadrada = inversa.sqrt

incrementaMCuadradoN :: Number -> Number -> Number
incrementaMCuadradoN m n = ((n+).(^2)) m

esResultadoPar :: Number -> Number -> Bool
esResultadoPar n m = ((even).(^m)) n