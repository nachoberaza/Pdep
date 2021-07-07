module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero



-- # Apuntes Type Classes # --
data Vaca =
    Vaca {
        nombre :: String,
        edad :: Number,
        raza :: String,
        peso :: Number
    } deriving Show

data Podadora =
    Podadora {
        marca :: String,
        superficie :: Number,
        potencia :: Number,
        Precio :: Number
    } deriving Show

instance Precio Podadora where
    precio podadora = superficie podadora * potencia podadora

aurora = Vaca "Aurora" 5 "Holando-argentino" 500
poda600 = Vaca "Poda600" 7 400


