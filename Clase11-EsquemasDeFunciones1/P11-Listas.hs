-- 7.
map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (x:xs) = (f x) : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' f [] = []
filter' f (x:xs) = (if f x then [x] else []) ++ filter' f xs

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' fr z [] = z
foldr' fr z (x:xs) = fr x (foldr' fr z xs)

recr' :: b -> (a -> [a] -> b -> b) -> [a] -> b
recr' z fr [] = z
recr' z fr (x:xs) = fr x xs (recr' z fr xs)

--foldr1 :: (a -> a -> a) -> [a] -> a
--foldr1 f [] = ?
--foldr1 f (x:xs) = f x (foldr1 xs)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f [] ys = []
zipWith' f (x:xs) ys = case ys of
                        [] -> []
                        (y:ys') -> (f x y) : (zipWith' f xs ys')

-- 9
sum :: [Int] -> Int
sum = foldr' (\x r -> x + r) 0

length' :: [a] -> Int
length' = foldr' (\x r -> 1 + r) 0

map'' :: (a -> b) -> [a] -> [b]
map'' = flip (foldr' (\x r -> \h -> h x : r h) (\h -> []))

filter'' :: (a -> Bool) -> [a] -> [a]
filter'' = flip (foldr' (\x r -> \h -> (if (h x) then [x] else []) ++ r h) (\h -> []))

find' :: (a -> Bool) -> [a] -> Maybe a
find' = flip (foldr' (\x r -> \h -> if (h x) then Just x else r h) (\h -> Nothing))
