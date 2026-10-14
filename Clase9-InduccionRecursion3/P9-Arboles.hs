data Arbol a b = Hoja b | Nodo a (Arbol a b) (Arbol a b) deriving (Show)

data EA = Const Int | BOp BinOp EA EA
data BinOp = Sum | Mul

arbolNumeros = NodeT 10
                (NodeT 5 EmptyT EmptyT)
                (NodeT 20
                    (NodeT 15
                        (NodeT 12 EmptyT EmptyT)
                        EmptyT)
                    (NodeT 30
                        (NodeT 25
                            (NodeT 22 EmptyT EmptyT)
                            EmptyT)
                        (NodeT 40 EmptyT EmptyT)))

arbolLetras = NodeT 'A'
                (NodeT 'B'
                    (NodeT 'D'
                        (NodeT 'G' EmptyT EmptyT)
                        (NodeT 'H' EmptyT EmptyT))
                    EmptyT)
                (NodeT 'C'
                    (NodeT 'E'
                        EmptyT
                        (NodeT 'I' EmptyT EmptyT))
                    (NodeT 'F' EmptyT EmptyT))

-- i.
cantidadDeHojas :: Arbol a b -> Int
cantidadDeHojas (Hoja y) = 1
cantidadDeHojas (Nodo x a1 a2) = (+) (cantidadDeHojas a1) (cantidadDeHojas a2)

-- ii.
cantidadDeNodos :: Arbol a b -> Int
cantidadDeNodos (Hoja y) = 0
cantidadDeNodos (Nodo x a1 a2) = 1 + (cantidadDeNodos a1) + (cantidadDeNodos a2)

-- iii.
cantidadDeConstructores :: Arbol a b -> Int
cantidadDeConstructores (Hoja y) = 1
cantidadDeConstructores (Nodo x a1 a2) = 1 + (cantidadDeConstructores a1) + (cantidadDeConstructores a2)

-- iv.
ea2Arbol :: EA -> Arbol BinOp Int
ea2Arbol (Const n) = Hoja n
ea2Arbol (BOp bo e1 e2) = Nodo bo (ea2Arbol e1) (ea2Arbol e2)

-- Ejercicio 3
data Tree a = EmptyT | NodeT a (Tree a) (Tree a) deriving (Show)

-- func EmptyT = ...
-- func (NodeT x t1 t2) = ...
-- i.
sumarT :: Tree Int -> Int
sumarT EmptyT = 0
sumarT (NodeT n t1 t2) = n + sumarT t1 + sumarT t2

-- ii.
sizeT :: Tree a -> Int
sizeT EmptyT = 0
sizeT (NodeT n t1 t2) = 1 + sizeT t1 + sizeT t2

-- iii.
anyT :: (a -> Bool) -> Tree a -> Bool
anyT f EmptyT = False
anyT f (NodeT x t1 t2) = f x || anyT f t1 || anyT f t2

-- iv.
countT :: (a -> Bool) -> Tree a -> Int
countT f EmptyT = 0
countT f (NodeT x t1 t2) = bool2Int (f x) + countT f t1 + countT f t2

bool2Int :: Bool -> Int
bool2Int True = 1
bool2Int False = 0

-- v.
countLeaves :: Tree a -> Int
countLeaves EmptyT = 0
countLeaves (NodeT x t1 t2) = case (t1, t2) of
                                (EmptyT, EmptyT) -> 1
                                (t1', t2') -> countLeaves t1' + countLeaves t2'

-- vi.
heightT :: Tree a -> Int
heightT EmptyT = 0
heightT (NodeT x t1 t2) = 1 + max (heightT t1) (heightT t2)

-- vii.
inOrder :: Tree a -> [a]
inOrder EmptyT = []
inOrder (NodeT x t1 t2) = (inOrder t1) ++ [x] ++ (inOrder t2)

-- viii.
listPerLevel :: Tree a -> [[a]]
listPerLevel EmptyT = []
listPerLevel (NodeT x t1 t2) = [x] : (juntarSublistas (listPerLevel t1) (listPerLevel t2))

juntarSublistas :: [[a]] -> [[a]] -> [[a]]
juntarSublistas [] yss = yss
juntarSublistas (xs:xss) yss = case yss of
                                [] -> (xs:xss)
                                (ys:yss') -> (xs ++ ys) : (juntarSublistas xss yss')

-- ix.
mirrorT :: Tree a -> Tree a
mirrorT EmptyT = EmptyT
mirrorT (NodeT x t1 t2) = NodeT x (mirrorT t2) (mirrorT t1)
