--module Inmobiliaria where
--import PdePreludat

type Barrio = String
type Mail = String
type Requisito = Depto -> Bool
type Busqueda = [Requisito]

data Depto = Depto{
    ambientes :: Int,
    superficie :: Int,
    precio :: Int,
    barrio :: Barrio
} deriving(Show, Eq)

data Persona = Persona{
    mail :: Mail,
    busquedas :: [Busqueda]
}

ordenarSegun :: ( a -> a -> Bool) -> [a] -> [a]
ordenarSegun _ [] = []
ordenarSegun criterio (x:xs) = 
    (ordenarSegun criterio . filter(not.criterio x)) xs ++
    [x] ++
    (ordenarSegun criterio . filter (criterio x)) xs

between :: Ord b => b -> b -> b -> Bool
between cotaInferior cotaSuperior valor = valor <= cotaSuperior && valor >= cotaInferior

deptosDeEjemplo = [
    Depto 3 80 7500 "Palermo",
    Depto 1 45 3500 "Villa Urquiza",
    Depto 2 50 5000 "Palermo",
    Depto 1 45 5500 "Recoleta"]

-- 1.a. Definir las funciones 'mayor' y 'menor' que reciban una funcion y dos valores, y retorna true si el resultado 
-- de evaluar esa funcion sobre el primer valor es mayor o menor que el resultado de evaluar sobre el segundo valor respectivamente.

mayor :: Ord b => (a -> b) -> a -> a -> Bool 
mayor f x y = f x > f y

menor :: Ord b => (a -> b) -> a -> a -> Bool 
menor f x y = f x < f y

-- 1.b. Mostrar un ejemplo de como se usaria una de estas funciones para ordenar una lista de strings en base a su longitud usando ordenarSegun

ejemploDeOrdenarSegun = ordenarSegun (mayor length) ["Carlos","Ana","Bernardo"]

-- 2.a. Definir 'ubicadoEn' que dada una lista de barrios que le interesan al usuario, retorne si el departamento se encuentra en alguno de los barrios de la lista

ubicadoEn :: [Barrio] -> Requisito
ubicadoEn barrios = (`elem` barrios).barrio

-- 2.b. Definir `cumpleRango` que a partir de una funcion y dos numeros,
-- indique si el valor retornado por la funcion al ser aplicada con el
-- departamento se encuentra entre los dos valores indicados.

cumpleRango :: Ord a => (Depto -> a ) -> a -> a -> Requisito
cumpleRango f cotaInferior cotaSuperior = between cotaInferior cotaSuperior . f

-- 3.a. Definir la funcion `cumpleBusqueda` que se cumple si todos los 
-- requisitos de una busqueda se verifican para un depto dado.

cumpleBusqueda :: Depto -> (Busqueda -> Bool)
-- con point free:
cumpleBusqueda depto = all (\requisito -> requisito depto) 

-- 3.b. Definir una funcion buscar que a partir de una busqueda, un criterio de ordenamiento y una lista de departamentos 
-- retorne todos aquellos que cumplen con la busqueda ordenados en base al criterio recibido.

buscar :: Busqueda -> (Depto -> Requisito) -> [Depto] -> [Depto]
buscar busqueda criterio = ordenarSegun criterio . filter (`cumpleBusqueda` busqueda) 


-- 3.c Mostrar un ejemplo de uso de buscar para obtener los departamentos de ejemplo, ordenado por mayor superficie, que cumplan con:
--  Encontrarse en Recoleta o Palermo
--  Ser de 1 o 2 ambientes
--  Alquilarse a menos de $6000 por mes

ejemploBuscar :: [Depto]
ejemploBuscar = buscar [ 
  ubicadoEn ["Recoleta", "Palermo"],
  cumpleRango ambientes 1 2, 
  cumpleRango precio 0 6000 
  ] (mayor superficie) deptosDeEjemplo


-- 4.c. Definir la funcion `mailsDePersonasInteresadas` que a partir de un departamento y una lista de personas
-- retorne los mails de las personas que tienen alguna busqueda que se cumpla para el departamento dado.

mailsDePersonasInteresadas :: Depto -> [Persona] -> [Mail]
mailsDePersonasInteresadas depto = map mail . filter (any (cumpleBusqueda depto) . busquedas)
