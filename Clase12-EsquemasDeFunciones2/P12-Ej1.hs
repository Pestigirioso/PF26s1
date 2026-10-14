data ExpA = Cte Int         -- Int -> ExpA
        | Suma ExpA ExpA    -- ExpA -> ExpA -> ExpA
        | Prod ExpA ExpA deriving (Show)   -- ExpA -> ExpA -> ExpA

foldExpA :: (Int -> b) -> (b -> b -> b) -> (b -> b -> b) -> ExpA -> b
foldExpA fc fs fp (Cte n) = fc n
foldExpA fc fs fp (Suma e1 e2) = fs (foldExpA fc fs fp e1) (foldExpA fc fs fp e2)
foldExpA fc fs fp (Prod e1 e2) = fp (foldExpA fc fs fp e1) (foldExpA fc fs fp e2)

ejexp = Suma (Suma (Cte 3) (Prod (Cte 3) (Cte 4))) (Prod (Cte 1) (Suma (Cte 0) (Cte 3)))
-- b.
-- i.
cantidadDeCeros :: ExpA -> Int
cantidadDeCeros = foldExpA  (\n -> if n == 0 then 1 else 0)
                            (\r1 r2 -> r1 + r2)
                            (\r1 r2 -> r1 + r2)

noTieneNegativosExplicitosExpA :: ExpA -> Bool
noTieneNegativosExplicitosExpA = foldExpA   (\n -> n >= 0)
                                            (\r1 r2 -> r1 && r2)
                                            (\r1 r2 -> r1 && r2)

simplificarExpA :: ExpA -> ExpA
simplificarExpA = foldExpA  (\n -> Cte n)
                            (\r1 r2 -> simplificarSuma r1 r2)
                            (\r1 r2 -> simplificarProd r1 r2)

simplificarSuma :: ExpA -> ExpA -> ExpA
simplificarSuma (Cte 0) e = e
simplificarSuma e (Cte 0) = e
simplificarSuma e1 e2 = Suma e1 e2

simplificarProd :: ExpA -> ExpA -> ExpA
simplificarProd (Cte 0) e = Cte 0
simplificarProd (Cte 1) e = e
simplificarProd e (Cte 0) = Cte 0
simplificarProd e (Cte 1) = e
simplificarProd e1 e2 = Prod e1 e2

evalExpA :: ExpA -> Int
evalExpA = foldExpA (\n -> n)
                    (\r1 r2 -> r1 + r2)
                    (\r1 r2 -> r1 * r2)

showExpA :: ExpA -> String
showExpA = foldExpA (\n -> show n)
                    (\s1 s2 -> "(" ++ s1 ++ "+" ++ s2 ++ ")")
                    (\s1 s2 -> "(" ++ s1 ++ "*" ++ s2 ++ ")")

recExpA :: (Int -> b) -> (ExpA -> b -> ExpA -> b -> b) -> (ExpA -> b -> ExpA -> b -> b) -> ExpA -> b
recExpA z fs fp (Cte n) = z n
recExpA z fs fp (Suma e1 e2) = fs e1 (recExpA z fs fp e1) e2 (recExpA z fs fp e2)
recExpA z fs fp (Prod e1 e2) = fp e1 (recExpA z fs fp e1) e2 (recExpA z fs fp e2)

cantDeSumaCeros :: ExpA -> Int
cantDeSumaCeros = recExpA   (\_ -> 0)
                            (\e1 r1 e2 r2 -> (if (esCte 0 e1) || (esCte 0 e2) then 1 else 0) + r1 + r2)
                            (\e1 r1 e2 r2 -> r1 + r2)

esCte :: Int -> ExpA -> Bool
esCte n (Cte x) = n == x
esCte _ _ = False

cantDeProdUnos :: ExpA -> Int
cantDeProdUnos = recExpA(\_ -> 0)
                        (\e1 r1 e2 r2 -> r1 + r2)
                        (\e1 r1 e2 r2 -> (if (esCte 1 e1) || (esCte 1 e2) then 1 else 0) + r1 + r2)

data EA = Const Int | BOp BinOp EA EA
data BinOp = Sum | Mul deriving (Show)

foldEA :: (Int -> b) -> (BinOp -> b -> b -> b) -> EA -> b
foldEA z f (Const n) = z n
foldEA z f (BinOp bop e1 e2) = f bop (foldEA z f e1) (foldEA z f e2)

recEA :: (Int -> b) -> (BinOp -> EA -> b -> EA -> b -> b) -> EA -> b
recEA z f (Const n) = z n
recEA z f (BinOp bop e1 e2) = f bop e1 (recEA z f e1) e2 (recEA z f e2)

noTieneNegativosExplicitosEA :: EA -> Bool
noTieneNegativosExplicitosEA = foldEA   (\n -> n >= 0)
                                        (\bop r1 r2 -> r1 && r2)

simplificarEA :: EA -> EA
simplificarEA = recEA   (\n -> Const n)
                        (\bop e1 r1 e2 r2 -> simpBinOp bop r1 r2)

simpBinOp :: BinOp -> EA -> EA -> EA
simpBinOp Sum (Const 0) e = e
simpBinOp Sum e (Const 0) = e
simpBinOp Mul (Const 0) e = Const 0
simpBinOp Mul e (Const 0) = Const 0
simpBinOp Mul (Const 1) e = e
simpBinOp Mul e (Const 1) = e

evalEA :: EA -> Int
evalEA = foldEA (\n -> n)
                (\bop r1 r2 -> evalBinOp r1 r2)

evalBinOp :: BinOp -> Int -> Int
evalBinOp Sum n m = n + m
evalBinOp Mul n m = n * m
