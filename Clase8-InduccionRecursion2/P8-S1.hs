-- a.
length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs

-- b.
sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum' xs

-- c.
product' :: [Int] -> Int
product' [] = 1
product' (x:xs) = x * product' xs

-- d.
concat' :: [[a]] -> [a]
concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

-- e.
elem' :: Eq a => a -> [a] -> Bool
elem' e [] = False
elem' e (x:xs) = e == x ||elem' e xs

-- f.
all' :: (a -> Bool) -> [a] -> Bool
all' f [] = True
all' f (x:xs) = f x && all' f xs

-- g.
any' ::  (a -> Bool) -> [a] -> Bool
any' f [] = False
any' f (x:xs) = f x || any' f xs

-- h.
count :: (a -> Bool) -> [a] -> Int
count f [] = 0
count f (x:xs) = (if (f x) then 1 else 0) + count f xs

-- i.
subset :: Eq a => [a] -> [a] -> Bool
subset [] ys = True
subset (x:xs) ys = elem x ys && subset xs ys

-- j. (++)
append :: [a] -> [a] -> [a]
append [] ys = ys
append (x:xs) ys = x : (xs `append` ys)

-- k
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse xs ++ [x]

-- l.
zip' :: [a] -> [b] -> [(a, b)]
zip' [] ys = []
zip' xs [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

-- m.
unzip' :: [(a, b)] -> ([a], [b])
unzip' [] = ([], [])
unzip' (p:ps) = repartirPar p (unzip' ps)

repartirPar :: (a,b) -> ([a], [b]) -> ([a], [b])
repartirPar (x,y) (xs, ys) = (x:xs, y:ys)
