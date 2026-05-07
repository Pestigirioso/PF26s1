-- Archivo con las funciones que se suelen repetir a lo largo de la cursada

suma' :: (Int, Int) -> Int
suma' (x, y) = x + y

suma :: Int -> Int -> Int
suma x y = x + y

doble :: Int -> Int
doble x = x + x

id :: a -> a
id x = x

const :: a -> b -> a
const x y = x

twice :: (a -> a) -> a -> a
twice f x = f (f x)

compose :: (b -> c) -> (a -> b) -> a -> c
compose f g x = f (g x)

flip :: (b -> (a -> c)) -> a -> b -> c
flip f x y = f y x

subst :: (a -> (b -> c)) -> (a -> b) -> a -> c
subst f g x = f x (g x)

curry :: ((a, b) -> c) -> a -> b -> c
curry f x y = f (x, y)

uncurry :: (a -> b -> c) -> (a, b) -> c
uncurry f (x, y) = f x y

apply :: (a -> b) -> a -> b
apply f x = f x

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

uflip :: ((a, b) -> c) -> ((b, a) -> c)
uflip f p = f (swap p)

appDup :: ((a, a) -> b) -> a -> b
appDup f x = f (x, x)

appFork :: (a -> b, a -> c) -> a -> (b, c)
appFork (f, g) x = (f x, g x)

appPar :: (a -> b, c -> d) -> (a, c) -> (b, d)
appPar (f, g) (x, y) = (f x, g y)

appDist :: (a -> b) -> (a, a) -> (b, b)
appDist f (x, y) = (f x, f y)

many :: Int -> (a -> a) -> a -> a
many 0 f x = x
many n f x = f (many (n - 1) f x)
