
funcion x y = (filter (> x) . map (\ f -> f y))
-- Esta funcion aplica cada elemento de la lista de funciones dadas al segundo parametro
-- y filtra los resultados de las funciones aplicadas buscando los mayores al primer parametro.
-- Parametros:
--  lista: Lista de funciones
--  x : Elemento comparable


-- Para dar mayor expresividad:
-- funcion ---> TransformaYFiltra ???