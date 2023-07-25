
type Restriccion = Producto -> Bool

data Producto = Prod{
  nombre :: String,
  precio :: Int
} deriving(Eq, Show)

queEmpieceConA :: Restriccion
queEmpieceConA = (=='a').head.nombre

barato :: Restriccion
barato = (<50).precio

restriccionesDeCompra :: [Restriccion]
restriccionesDeCompra = [queEmpieceConA, barato]

-- 1. Tipos de la funcion restriccionDeCompra\


-- 2. Modificar queEmpieceConA para que verifique que el nombre del producto comience con una letra
-- que se pase como parametro. Indicar que cambiaria en la representacion de restriccionesDeCompra y que
-- concepto esta relacionado.

productoEjemplo :: Producto
productoEjemplo = Prod "cocacola" 400

productoEjemplo2 :: Producto
productoEjemplo2 = Prod "azucar" 10

queEmpieceCon :: Char -> Producto -> Bool
queEmpieceCon letra = (== letra).head.nombre

-- Rta: En esta solucion se "quita" la aplicacion parcial que ya poseia la funcion empieceConA, haciendo que ahora se deba pasar
-- por parametro la letra con la que empieza.

-- 3. Codificar una funcion que permita establecer, dada una list de productos y una lista de restricciones,
-- cuales productos verifican todas las restricciones. Mencione los conceptos que resaltan en la solucion.

cumpleTodo :: [Restriccion] -> Producto -> Bool
cumpleTodo restricciones producto = all(\restriccion -> restriccion producto) restricciones 

cumplenTodo ::[Restriccion] -> [Producto] -> [Producto]
cumplenTodo restricciones = filter (cumpleTodo restricciones) 


