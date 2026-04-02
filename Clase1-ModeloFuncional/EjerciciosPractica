# Ejercicio 1) Indicar los tipos de las definiciones

a. first (x, y) = x

```
f :: A -> B
e :: A
------------
f e :: B

Con f <- first, e <- (x,y)

first :: (a, b) -> a
(x, y) :: (a, b)
-----------------
first (x, y) :: a
```

b. apply f = g
        where g x = f x

```
apply :: (a -> b) -> (a -> b)
f     :: (a -> b)
---------------------
apply f :: a -> b

g :: a -> b
x :: a
-----------
g x :: b

f :: a -> b
x :: a
------------
f x :: b
```

c. twice f = g
        where g x = f (f x)
        
```
twice :: (a -> a) -> (a -> a)
f :: a -> a
------------
twice f :: a -> a

g :: a -> a
x :: a
----------
g x :: a

f   :: a -> a
f x :: a
-----------
f (f x) :: a

f :: a -> a
x :: a
--------------
f x :: a
```

d. doble x = x + x
```
doble :: Int -> Int
x :: Int
---------
doble x :: Int

x :: Int
x :: Int
--------------
x + x :: Int
```

e. swap (x, y) = (y, x)

```
swap :: (a, b) -> (b, a)
(x,y) :: (a, b)
-------------
swap (x, y) :: (b, a)

y :: b
x :: a
------------
(y, x) :: (b, a)
```

f. uflip f = g
        where g p = f (swap p)

```
uflip :: ((b, a) -> c) -> ((a, b) -> c)
f :: (b, a) -> c
-------------
uflip f :: (a, b) -> c

g :: (a, b) -> c  => Es (uflip f)
p :: (a, b)
--------------
g p :: c        => Es (f (swap p))

f :: (b, a) -> c
swap p :: (b, a)
----------------
f (swap p) :: c

swap :: (a, b) -> (b, a)
p :: (a, b)
-------------
swap p :: (b, a)
```

# Ejercicio 2) Dadas las definiciones anteriores, indicar el tipo de las siguientes expresiones

a. apply first

```
apply :: (a' -> b') -> (a' -> b')
first :: (a, b) -> a
-------------------------------
apply first ::

reemplazo a' <- (a, b)
reemplazo b' <- a

apply :: ((a, b) -> a) -> ((a, b) -> a)
first :: (a, b) -> a
-----------------------------------
apply first :: (a, b) -> a
```

b. first (swap, uflip)

```
first :: (a'', b'') -> a''
(swap, uflip) :: ((a, b) -> (b, a), ((b', a') -> c') -> ((a', b') -> c'))
---------------------------------------------
first (swap, uflip) ::

reemplazo a'' <- (a, b) -> (b, a)
reemplazo b'' <- ((b', a') -> c') -> ((a', b') -> c'))

first :: ((a, b) -> (b, a), ((b', a') -> c') -> ((a', b') -> c')))
(swap, uflip) :: ((a, b) -> (b, a), ((b', a') -> c') -> ((a', b') -> c'))
----------------------------------------
first (swap, uflip) :: (a, b) -> (b, a)
```

c. twice doble

```
twice :: (a -> a) -> (a -> a)
doble :: Int -> Int
------------------------
twice doble ::

Reemplazo a <- Int

twice :: (Int -> Int) -> (Int -> Int)
doble :: Int -> Int
----------------------
twice doble :: Int -> Int
```

d. twice twice

```
twice :: (a' -> a') -> (a' -> a')
twice :: (a -> a) -> (a -> a)
-----------------------------
twice twice ::

reemplazo a' <- (a -> a)

twice :: ((a -> a) -> (a -> a)) -> ((a -> a) -> (a -> a))
twice :: (a -> a) -> (a -> a)
-------------------------
twice twice :: (a -> a) -> (a -> a)
```

e. twice uflip

```
twice :: (a' -> a') -> (a' -> a')
uflip :: ((b, a) -> c) -> ((a, b) -> c)
---------------------------------------
twice uflip :: 

reemplazo b <- a

twice :: (a' -> a') -> (a' -> a')
uflip :: ((a, a) -> c) -> ((a, a) -> c)
---------------------------------------
twice uflip::

reemplazo a' <- (a, a) -> c
twice :: (((a, a) -> c) -> ((a, a) -> c)) -> (((a, a) -> c) -> ((a, a) -> c))
uflip :: ((a, a) -> c) -> ((a, a) -> c)
---------------------------------
twice uflip :: ((a, a) -> c) -> ((a, a) -> c)
```

f. twice swap

```
twice :: (a' -> a') -> (a' -> a')
swap :: (a, b) -> (b, a)
-----------------------------------
twice swap

reemplazo b <- a, y me queda swap :: (a, a) -> (a, a)
a' <- (a, a)

twice :: ((a, a) -> (a, a)) -> ((a, a) -> (a,a))
swap :: (a, a) -> (a,a)
----------------------
twice swap :: (a, a) -> (a, a)
```

g. uflip swap

```
uflip :: ((a', b') -> c) -> ((b', a') -> c)
swap :: (a, b) -> (b, a)
-------------------------------------------
uflip swap ::

Reemplazo a' <- a
Reemplazo b' <- b
reemplazo c -> (b, a)

uflip :: ((a, b) -> (b, a)) -> ((b, a) -> (b, a))
swap :: (a, b) -> (b, a)
----------------------------------
uflip swap :: (b, a) -> (b, a)
```

h. (twice twice) swap

```
twice twice :: (a' -> a') -> (a' -> a')
swap :: (a, b) -> (b, a)
--------------------------------
(twice twice) swap ::

Reemplazo b <- a
reemplazo a' <- (a, a)

twice twice :: ((a, a) -> (a, a)) -> ((a, a) -> (a, a))
swap :: (a, a) -> (a, a)
------------------------------
(twice twice) swap :: (a, a) -> (a, a)
```
