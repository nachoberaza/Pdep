type Sintoma = String

amoxilina :: Medicamento
amoxilina = cura "infeccion"
bicarbonato = cura "picazon"
sugestion _ = []

cura :: Sintoma -> [Sintoma] -> [Sintoma]
cura sintoma = filter (/= sintoma)

malMovimiento = ["dolor agudo","hinchazon"]
varicela = repeat "picazon"

mejorMedicamentoPara sintomas = head.filter (idealPara sintomas)

idealPara :: [Sintoma] -> Medicamento -> Bool
idealPara sintomas medicamento = 
  medicamento sintomas == []

-- Consignas
-- 1. Definir el tipo "Medicamento" en base al modelo dado y explicar el tipo de la funcion "mejorMedicamentoPara".

-- 2. Explicar que beneficio aporta el uso de orden superior a la definicion de "mejorMedicamentoPara".

-- 3. Definir y explicar el tipo del ibuprofeno, para que pueda usarse como medicamento, que cure tanto el "dolor agudo", como la "hinchazon" si es de mas 
-- de 500 miligramos, y de los contrario cure el "dolor moderado".
-- Armar una lista de medicamentos que incluya amoxicilina e ibuprofeno de 400 miligramos. En caso de que se este aprovechando algun concepto importante para llevarlo a cabo, 
-- mencionarlo.

-- 4. ¿Que sucedera al evaluar las siguiente consultas? Justificar conceptualmente. En caso de errores o comportamientos inesperados, indicar cuales son y donde ocurren.
-- a. mejorMedicamentoPara malMovimiento (repeat bicarbonato)
-- b. mejorMedicamentoPara varicela [sugestion, bicarbonato, amoxicilina]


-- Respuestas: --

-- 1. 
type Medicamento = [Sintoma] -> [Sintoma]

mejorMedicamentoPara :: [Sintoma] -> [Medicamento] -> Medicamento 

-- 2. 
-- La aplicacion de orden superior en la funcion ayuda haciendo que mediante el "filter", no se tenga que verificar por cada uno de los elementos si se cumple la condicion
-- de si es ideal para los sintomas indicados.

-- 3. 
type Cantidad = Int

ibuprofeno :: Cantidad -> [Sintoma] -> [Sintoma]
ibuprofeno _ = ([] ++)

listaMedicamentos = [amoxilina,ibuprofeno 4]

-- 4. 
-- a. Al ejecutar dicha consulta ocurriran dos cosas: se va a intentar flitrar por el mejor medicamento de una lista infinita de bicarbonatos.
-- Sin embargo, gracias a la evaluacion perezosa, esto no va a tirar un error. Luego, se aplicar el medicamento (bicarbonato) a los sintomas, 
-- esto va a retornar una lista vacia, curar ya que no es ideal para a los sintomas del mal movimiento (lista de sintomas). Todo esto ocasiona
-- que el head de una lista vacia lance un error ya que no es posible realizar dicha operacion.

-- b. Para este caso, no se va a producir un error ya que la funcion mejorMedicamentoPara se encarga de filtrar de medicamentos en base a 
-- la aplicacion de una lista (infinita) de sintomas. Sin embargo, se va a cumplir la condicion de filtrado con el medicamento "sugetion", lo
-- que va a provocar que se genere una lista con un solo elemento que va a ser ese medicamento. Y por ultimo a la hora de hacer el head, se obtendra
-- dicho medicamento.  