data Pizza = Prepizza | Capa Ingrediente Pizza deriving (Show)
data Ingrediente = Aceitunas Int | Anchoas | Cebolla
                    | Jamon | Queso | Salsa deriving (Show, Eq)

pizzaTest = Capa (Aceitunas 4)
                (Capa Queso
                    (Capa Anchoas
                        (Capa (Aceitunas 7)
                            (Capa (Aceitunas 2)
                                (Capa Jamon
                                    (Capa Queso
                                        (Capa Salsa
                                            (Capa Cebolla
                                                Prepizza))))))))

pizzaTest2 = Capa Queso (Capa Jamon (Capa Salsa Prepizza))

-- 1
-- a.
cantidadCapasQueCumplen :: (Ingrediente -> Bool) -> Pizza -> Int
cantidadCapasQueCumplen f Prepizza = 0
cantidadCapasQueCumplen f (Capa i p) = (if (f i) then 1 else 0) + cantidadCapasQueCumplen f p

-- b.
conCapasTransformadas :: (Ingrediente -> Ingrediente) -> Pizza -> Pizza
conCapasTransformadas f Prepizza = Prepizza
conCapasTransformadas f (Capa i p) = Capa (f i) (conCapasTransformadas f p)

-- c.
soloLasCapasQue :: (Ingrediente -> Bool) -> Pizza -> Pizza
soloLasCapasQue f Prepizza = Prepizza
soloLasCapasQue f (Capa i p) = case f i of
                                    True -> Capa i (soloLasCapasQue f p)
                                    False -> soloLasCapasQue f p

-- 2.
esQueso :: Ingrediente -> Bool
esQueso Queso = True
esQueso _ = False
-- a.
sinLactosa :: Pizza -> Pizza
sinLactosa p = soloLasCapasQue' (\i -> not (esQueso i)) p

-- b.
aptaIntolerantesLactosa :: Pizza -> Bool
aptaIntolerantesLactosa p = cantidadCapasQueCumplen' (\i -> esQueso i) p == 0

-- c.
cantidadDeQueso :: Pizza -> Int
cantidadDeQueso = cantidadCapasQueCumplen' (\i -> esQueso i)

-- d.
conElDobleAceitunas :: Pizza -> Pizza
conElDobleAceitunas = conCapasTransformadas' duplicarAceitunas

duplicarAceitunas :: Ingrediente -> Ingrediente
duplicarAceitunas (Aceitunas n) = Aceitunas (2*n)
duplicarAceitunas i = i

-- 3.
pizzaProcesada :: (Ingrediente -> b -> b) -> b -> Pizza -> b
pizzaProcesada f z Prepizza = z
pizzaProcesada f z (Capa i p) = f i (pizzaProcesada f z p)

-- 4.
cantidadCapasQueCumplen' :: (Ingrediente -> Bool) -> Pizza -> Int
cantidadCapasQueCumplen' f = pizzaProcesada (\i n -> (if f i then 1 else 0) + n) 0

conCapasTransformadas' :: (Ingrediente -> Ingrediente) -> Pizza -> Pizza
conCapasTransformadas' f = pizzaProcesada (\i pt -> Capa (f i) pt) Prepizza

soloLasCapasQue' :: (Ingrediente -> Bool) -> Pizza -> Pizza
soloLasCapasQue' f = pizzaProcesada (\i pf -> case f i of
                                    True -> Capa i pf
                                    False -> pf) Prepizza

sinLactosa' :: Pizza -> Pizza
sinLactosa' = pizzaProcesada (\i p -> if esQueso i
                                        then p
                                        else Capa i p) Prepizza

aptaIntolerantesLactosa' :: Pizza -> Bool
aptaIntolerantesLactosa' = pizzaProcesada (\i b -> not (esQueso i) && b) True

cantidadDeQueso' :: Pizza -> Int
cantidadDeQueso' = pizzaProcesada (\i n -> (if esQueso i then 1 else 0) + n) 0

conElDobleAceitunas' :: Pizza -> Pizza
conElDobleAceitunas' = pizzaProcesada (\i p -> Capa (duplicarAceitunas i) p) Prepizza

-- 5.
-- a.
cantidadDeAceitunas :: Pizza -> Int
cantidadDeAceitunas = pizzaProcesada (\i n -> (numAceitunas i) + n) 0

numAceitunas :: Ingrediente -> Int
numAceitunas (Aceitunas n) = n
numAceitunas _ = 0

-- b.
capasQueCumplen :: (Ingrediente -> Bool) -> Pizza -> [Ingrediente]
capasQueCumplen f = pizzaProcesada (\i xs -> (if f i then [i] else []) ++ xs) []

-- c.
conDescripcionMejorada :: Pizza -> Pizza
conDescripcionMejorada = pizzaProcesada (\i p -> juntarAceitunas i p) Prepizza

juntarAceitunas :: Ingrediente -> Pizza -> Pizza
juntarAceitunas (Aceitunas n) (Capa (Aceitunas m) p) = Capa (Aceitunas (n + m)) p
juntarAceitunas i p = Capa i p

-- d.
conCapasDe' :: Pizza -> Pizza -> Pizza
conCapasDe' Prepizza p2    = p2
conCapasDe' (Capa i p1) p2 = Capa i (conCapasDe' p1 p2)

conCapasDe :: Pizza -> Pizza -> Pizza
conCapasDe = flip (pizzaProcesada (\i p -> Capa i (p)))

-- e.
primerasNCapas' :: Int -> Pizza -> Pizza
primerasNCapas' n Prepizza = Prepizza
primerasNCapas' n (Capa i p) = if n== 0
                                then Prepizza
                                else Capa i (primerasNCapas' (m - 1) p)

primerasNCapas :: Int -> Pizza -> Pizza
primerasNCapas = flip (pizzaProcesada fc (\n -> Prepizza))
                    where fc i fr = \n -> if n == 0 then Prepizza else Capa i (fr (n-1))
