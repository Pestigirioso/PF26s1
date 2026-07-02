-- Ejercicio 3

data Pizza = Prepizza | Capa Ingrediente Pizza deriving (Show)

data Ingrediente = Aceitunas Int | Anchoas | Cebolla | Jamon | Queso | Salsa deriving (Show)

-- Esquema de recursion
-- f Prepizza = ...
-- f (Capa i p) = ... i ... f p

cantidadDeCapas :: Pizza -> Int
cantidadDeCapas Prepizza = 0
cantidadDeCapas (Capa i p) = 1 + cantidadDeCapas p

cantidadDeAceitunas :: Pizza -> Int
cantidadDeAceitunas Prepizza = 0
cantidadDeAceitunas (Capa i p) = numAceitunas i + cantidadDeAceitunas p

numAceitunas :: Ingrediente -> Int
numAceitunas (Aceitunas n) = n
numAceitunas i = 0

duplicarAceitunas :: Pizza -> Pizza
duplicarAceitunas Prepizza = Prepizza
duplicarAceitunas (Capa i p) = Capa (dupAceitunas i) (duplicarAceitunas p)

dupAceitunas :: Ingrediente -> Ingrediente
dupAceitunas (Aceitunas n) = Aceitunas (2 * n)
dupAceitunas i = i

sinLactosa :: Pizza -> Pizza
sinLactosa Prepizza = Prepizza
sinLactosa (Capa i p) = construirSinQueso (Capa i (sinLactosa p))

construirSinQueso :: Pizza -> Pizza
construirSinQueso (Capa Queso p) = p
construirSinQueso p = p

aptaIntolerantesLactosa :: Pizza -> Bool
aptaIntolerantesLactosa Prepizza = True
aptaIntolerantesLactosa (Capa i p) = not (esQueso i) && aptaIntolerantesLactosa p

esQueso :: Ingrediente -> Bool
esQueso Queso = True
esQueso _ = False

conDescripcionMejorada :: Pizza -> Pizza
conDescripcionMejorada Prepizza = Prepizza
conDescripcionMejorada (Capa i p) = juntarAceitunas i (conDescripcionMejorada p)

juntarAceitunas :: Ingrediente -> Pizza -> Pizza
juntarAceitunas (Aceitunas n) (Capa (Aceitunas m) p) = Capa (Aceitunas (n + m)) p
juntarAceitunas i p = Capa i p

pizzaPruebas = Capa (Aceitunas 4) (Capa (Aceitunas 2) (Capa (Aceitunas 7) (Capa Jamon (Capa Queso (Capa (Aceitunas 5) Prepizza)))))
