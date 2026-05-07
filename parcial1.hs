data DigDec = D0 | D1 | D2 | D3 | D4 | D5 | D6 | D7 | D8 | D9 deriving (Show)

ddAsInt :: DigDec -> Int
ddAsInt D0 = 0
ddAsInt D1 = 1
ddAsInt D2 = 2
ddAsInt D3 = 3
ddAsInt D4 = 4
ddAsInt D5 = 5
ddAsInt D6 = 6
ddAsInt D7 = 7
ddAsInt D8 = 8
ddAsInt D9 = 9

nextDDAsInt :: DigDec -> Int
nextDDAsInt D0 = 1
nextDDAsInt D1 = 2
nextDDAsInt D2 = 3
nextDDAsInt D3 = 4
nextDDAsInt D4 = 5
nextDDAsInt D5 = 6
nextDDAsInt D6 = 7
nextDDAsInt D7 = 8
nextDDAsInt D8 = 9
nextDDAsInt D9 = 0

ddOfInt :: Int -> DigDec
ddOfInt 0 = D0
ddOfInt 1 = D1
ddOfInt 2 = D2
ddOfInt 3 = D3
ddOfInt 4 = D4
ddOfInt 5 = D5
ddOfInt 6 = D6
ddOfInt 7 = D7
ddOfInt 8 = D8
ddOfInt 9 = D9

nextDD :: DigDec -> DigDec
nextDD D0 = D1
nextDD D1 = D2
nextDD D2 = D3
nextDD D3 = D4
nextDD D4 = D5
nextDD D5 = D6
nextDD D6 = D7
nextDD D7 = D8
nextDD D8 = D9
nextDD D9 = D0

prevDD :: DigDec -> DigDec
prevDD D0 = D9
prevDD D1 = D0
prevDD D2 = D1
prevDD D3 = D2
prevDD D4 = D3
prevDD D5 = D4
prevDD D6 = D5
prevDD D7 = D6
prevDD D8 = D7
prevDD D9 = D8

twice :: (a->a) -> a -> a
twice f x = f (f x)

compose :: (b'->c') -> (a'->b') -> a' -> c'
compose f g x = f (g x)

compose12 :: (d''-> c'') -> (a'' -> b''-> d'') -> a'' -> b'' -> c''
compose12 f g x y = f (g x y)

doblecompo :: (b -> a) -> (a -> b) -> a -> a
doblecompo = \f -> \g -> \x -> f (g (f (g x)))
