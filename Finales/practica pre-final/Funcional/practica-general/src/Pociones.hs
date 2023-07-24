data Persona = Persona {
  nombrePersona :: String,
  suerte :: Int,
  inteligencia :: Int,
  fuerza :: Int
} deriving (Show, Eq)

data Pocion = Pocion {
  nombrePocion :: String,
  ingredientes :: [Ingrediente]
}

type Efecto = Persona -> Persona

data Ingrediente = Ingrediente {
  nombreIngrediente :: String,
  efectos :: [Efecto]
}

nombresDeIngredientesProhibidos :: [String]
nombresDeIngredientesProhibidos = [
 "sangre de unicornio",
 "veneno de basilisco",
 "patas de cabra",
 "efedrina"]

maximoSegun :: Ord a1 => (a2 -> a1) -> [a2] -> a2
maximoSegun _ [ x ] = x

maximoSegun  f ( x : y : xs)
  | f x > f y = maximoSegun f (x:xs)
  | otherwise = maximoSegun f (y:xs)


--1. Dada una persona definir las siguientes funciones para cuantificar sus niveles de suerte, inteligencia y fuerza sin repetir código:
-- sumaDeNiveles que suma todos sus niveles.
-- diferenciaDeNiveles es la diferencia entre el nivel más alto y más bajo.
-- nivelesMayoresA n, que indica la cantidad de niveles de la persona que están por encima del valor dado.

niveles :: Persona -> [Int]
niveles persona = [fuerza persona,inteligencia persona,suerte persona]

sumaDeNiveles :: Persona -> Int
sumaDeNiveles persona = fuerza persona + suerte persona + inteligencia persona

maximoNivel :: Persona -> Int
maximoNivel = maximum.niveles 

minimoNivel :: Persona -> Int
minimoNivel = minimum.niveles

diferenciaDeNiveles :: Persona -> Int
diferenciaDeNiveles persona = maximoNivel persona - minimoNivel persona

nivelesMayoresA :: Int -> Persona -> Int
nivelesMayoresA n = length.filter(>n).niveles

--2. Definir la función efectosDePocion que dada una poción devuelve una lista con los efectos de todos sus ingredientes.

efectosDePocion :: Pocion -> [Efecto]
efectosDePocion = concat . map efectos . ingredientes

-- 3. Dada una lista de pociones, consultar:
-- Los nombres de las pociones hardcore, que son las que tienen al menos 4 efectos.
-- La cantidad de pociones prohibidas, que son aquellas que tienen algún ingrediente cuyo nombre figura en la lista de ingredientes prohibidos.
-- Si son todas dulces, lo cual ocurre cuando todas las pociones de la lista tienen algún ingrediente llamado “azúcar”.

pocionesHardcore :: [Pocion] -> [String]
pocionesHardcore = map nombrePocion . filter( (>3) . length . efectosDePocion )

pocionProhibida :: Pocion -> Bool
pocionProhibida = any (flip elem nombresDeIngredientesProhibidos . nombreIngrediente) . ingredientes

cantPocionesProhibidas :: [Pocion] -> Int
cantPocionesProhibidas = length . filter pocionProhibida

pocionDulce :: Pocion -> Bool
pocionDulce = any ((=="azucar") . nombreIngrediente) . ingredientes

todasDulces :: [Pocion] -> Bool
todasDulces = all pocionDulce  

-- 4. Definir la función tomarPocion que recibe una poción y una persona,
-- y devuelve como quedaría la persona después de tomar la poción. 
-- Cuando una persona toma una poción, se aplican todos los efectos de esta última, en orden.

tomarPocion :: Pocion -> Efecto -- Pocion -> (Persona -> Persona)
tomarPocion pocion personaInicial = foldl(\persona efecto -> efecto persona) personaInicial (efectosDePocion pocion)


-- 5. Definir la función esAntidotoDe que recibe dos pociones y una persona,
-- y dice si tomar la segunda poción revierte los cambios que se producen en la persona al tomar la primera.

-- esAntidotoDe :: Pocion -> Pocion -> Persona -> Bool
-- esAntidotoDe pocion antidoto persona = 
--  tomarPocion antidoto (tomarPocion pocion persona) == persona 

esAntidotoDe :: Pocion -> Pocion -> Persona -> Bool
esAntidotoDe pocion antidoto persona = ( (==persona) . tomarPocion antidoto . tomarPocion pocion) persona

-- 6. Definir la función personaMasAfectada que recibe una poción,
-- una función cuantificadora (es decir, una función que dada una persona retorna un número)
-- y una lista de personas, y devuelve a la persona de la lista que hace máxima el valor del cuantificador.
-- Mostrar un ejemplo de uso utilizando los cuantificadores definidos en el punto 1.

personaMasAfectada :: Pocion -> ( Persona -> Int ) -> [Persona] -> Persona
personaMasAfectada pocion cuantificadora = maximoSegun (cuantificadora.tomarPocion pocion) 

pocionDefault = Pocion "placebo" []
funcionCriterio = nivelesMayoresA 10
personasDeEjemplo = []

ejemploPersonaMasAfectada = personaMasAfectada pocionDefault funcionCriterio personasDeEjemplo