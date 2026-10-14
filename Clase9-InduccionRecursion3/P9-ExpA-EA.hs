data EA = Const Int | BOp BinOp EA EA
data BinOp = Sum | Mul

data ExpA = Cte Int
    | Suma ExpA ExpA
    | Prod ExpA ExpA

evalExpA :: ExpA -> Int
evalExpA (Cte x) = x
evalExpA (Suma e1 e2) = (evalExpA e1) + (evalExpA e2)
evalExpA (Prod e1 e2) = (evalExpA e1) * (evalExpA e2)
--i.
evalEA :: EA -> Int
evalEA (Const n) = n
evalEA (BOp bo e1 e2) = evalBinOp bo (evalEA e1) (evalEA e2)

evalBinOp :: BinOp -> Int -> Int -> Int
evalBinOp Sum x y = x + y
evalBinOp Mul x y = x * y

-- ii.
ea2ExpA :: EA -> ExpA
ea2ExpA (Const x) = Cte x
ea2ExpA (BOp bo e1 e2) = bop2ExpA bo (ea2ExpA e1) (ea2ExpA e2)

bop2ExpA :: BinOp -> ExpA -> ExpA -> ExpA
bop2ExpA Sum e1 e2 = Suma e1 e2
bop2ExpA Mul e1 e2 = Prod e1 e2

-- iii.
expA2EA :: ExpA -> EA
expA2EA (Cte x) = Const x
expA2EA (Suma e1 e2) = BOp Sum (expA2EA e1) (expA2EA e2)
expA2EA (Prod e1 e2) = BOp Mul (expA2EA e1) (expA2EA e2)
