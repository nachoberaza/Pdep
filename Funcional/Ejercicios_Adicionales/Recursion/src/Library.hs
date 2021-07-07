module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

-- ---------------------------------------------------------------------
-- Ejercicio 1. Definir por recursion la funcion
--    potencia :: Integer -> Integer -> Integer
-- tal que (potencia x n) es x elevado al numero natural n. Por ejemplo,  
--    potencia 2 3  ==  8
-- ---------------------------------------------------------------------

potencia m 0 = 1
potencia m n = m * (potencia m (n-1))

-- ---------------------------------------------------------------------
-- Ejercicio 2. Definir por recursión la función
--    replicate' :: Int -> a -> [a]
-- tal que (replicate' n x) es la lista formado por n copias del
-- elemento x. Por ejemplo,
--    replicate' 3 2  ==  [2,2,2]
-- ---------------------------------------------------------------------

replicate' 0 _ = []
replicate' n x = x : replicate' (n-1) x
 
-- ---------------------------------------------------------------------
-- Ejercicio 3. El doble factorial de un número n se define por 
--    n!! = n*(n-2)* ... * 3 * 1, si n es impar
--    n!! = n*(n-2)* ... * 4 * 2, si n es par
--    1!! = 1
--    0!! = 1    
-- Por ejemplo,
--    8!! = 8*6*4*2   = 384
--    9!! = 9*7*5*3*1 = 945
-- Definir, por recursión, la función
--    dobleFactorial :: Integer -> Integer
-- tal que (dobleFactorial n) es el doble factorial de n. Por ejemplo,
--    dobleFactorial 8  ==  384
--    dobleFactorial 9  ==  945
-- ---------------------------------------------------------------------

dobleFactorial 0 = 1
dobleFactorial 1 = 1
dobleFactorial n = n * dobleFactorial (n-2)

-- ---------------------------------------------------------------------
-- Ejercicio 4. Dados dos números naturales, a y b, es posible
-- calcular su máximo común divisor mediante el Algoritmo de
-- Euclides. Este algoritmo se puede resumir en la siguiente fórmula:
--    mcd(a,b) = a,                   si b = 0
--             = mcd (b, a módulo b), si b > 0
-- 
-- Definir la función 
--    mcd :: Integer -> Integer -> Integer
-- tal que (mcd a b) es el máximo común divisor de a y b calculado
-- mediante el algoritmo de Euclides. Por ejemplo,
--    mcd 30 45  ==  15
-- ---------------------------------------------------------------------

mcd a 0 = a
mcd a b = mcd b (a `mod` b) 

-- ---------------------------------------------------------------------
-- Ejercicio 5.1. Definir por recursión la función
--    menorDivisible :: Integer -> Integer -> Integer
-- tal que (menorDivisible a b) es el menor número divisible por los
-- números del a al b. Por ejemplo,
--    menorDivisible 2 5  ==  60
-- Indicación: Usar la función lcm tal que (lcm x y) es el mínimo común
-- múltiplo de x e y.
-- ---------------------------------------------------------------------


menorDivisible  a b  
    | a == b    = a
    | otherwise = lcm a (menorDivisible (a+1) b)

-- ---------------------------------------------------------------------
-- Ejercicio 5.2. Definir la constante
--    euler5 :: Integer
-- tal que euler5 es el menor número divisible por los números del 1 al
-- 20 y calcular su valor.
-- ---------------------------------------------------------------------
 
euler5 :: Number
euler5 = menorDivisible 1 20


-- ---------------------------------------------------------------------
-- Ejercicio 6. En un templo hindú se encuentran tres varillas de
-- platino. En una de ellas, hay 64 anillos de oro de distintos radios,
-- colocados de mayor a menor.
-- 
-- El trabajo de los monjes de ese templo consiste en pasarlos todos a
-- la tercera varilla, usando la segunda como varilla auxiliar, con las
-- siguientes condiciones: 
--   * En cada paso sólo se puede mover un anillo.
--   * Nunca puede haber un anillo de mayor diámetro encima de uno de
--     menor diámetro.
-- La leyenda dice que cuando todos los anillos se encuentren en la
-- tercera varilla, será el fin del mundo.  
-- 
-- Definir la función 
--    numPasosHanoi :: Integer -> Integer
-- tal que (numPasosHanoi n) es el número de pasos necesarios para
-- trasladar n anillos. Por ejemplo, 
--    numPasosHanoi 2   ==  3
--    numPasosHanoi 7   ==  127
--    numPasosHanoi 64  ==  18446744073709551615
-- ---------------------------------------------------------------------

-- Sean A, B y C las tres varillas. La estrategia recursiva es la
-- siguiente: 
-- * Caso base (N=1): Se mueve el disco de A a C.
-- * Caso inductivo (N=M+1): Se mueven M discos de A a C. Se mueve el disco
--   de A a B. Se mueven M discos de C a B.
-- Por tanto,

numPasosHanoi 1 = 1
numPasosHanoi n = 1 + 2 * numPasosHanoi (n-1) 


-- ---------------------------------------------------------------------
-- Ejercicio 7. Definir por recursión la función
--    and' :: [Bool] -> Bool
-- tal que (and' xs) se verifica si todos los elementos de xs son
-- verdadero. Por ejemplo,
--    and' [1+2 < 4, 2:[3] == [2,3]]  ==  True
--    and' [1+2 < 3, 2:[3] == [2,3]]  ==  False
-- ---------------------------------------------------------------------

and' []     = True
and' (b:bs) = b && and' bs

-- ---------------------------------------------------------------------
-- Ejercicio 8. Definir por recursion la funcion
--    selecciona :: [a] -> Int -> a
-- tal que (selecciona xs n) es el n-esimo elemento de xs. Por ejemplo,
--    selecciona [2,3,5,7] 2  ==  5 
-- ---------------------------------------------------------------------
--selecciona :: [a] -> Number -> a

selecciona [] _ = error "No puede seleccionar un elemento si la lista esta vacia"
selecciona x 0 = head(x)
selecciona (x:xs) n = selecciona xs (n-1)