# Ejercicio 0
```
doble :: Int -> Int
doble x = x + x

##########################

id :: a -> a
x  :: a
-----------
id x ::a

x :: a

###########################
suma :: Int -> (Int -> Int)
suma x = g
    where g y = x + y

suma :: Int -> (int -> Int)
x :: Int
--------------------
suma x :: Int -> Int

g :: Int -> Int
y :: Int
------------------------
g y :: Int (Es la función (+) x y)

(+) :: Int -> (Int -> Int)
x :: Int
---------------
(+) x :: (Int -> Int)

(+) x :: Int -> Int
y :: Int 
------------------
(+) x y :: Int

##################################
const ::
const x = g
    where g y = x
    
const :: a -> (b -> a)
x :: a
--------------------
const x :: b -> a

g :: b -> a
y :: b
------------------------
g y :: a 

x :: a
################################
compose :: 
compose f = h
    where h g = k
        where k x = f (g x)
        
compose :: (b -> c) -> ((a -> b) -> (a -> c))
f :: (b -> c)
------------------------------------
compose f :: (a -> b) -> (a -> c)

h :: (a -> b) -> (a -> c)
g :: a -> b
--------------------------------
h g :: a -> c

k :: a -> c
x :: a
-------------------------------
k x :: c

f :: b -> c
g x :: b
----------------------
f (g x) :: c

g :: a -> b
x :: a
------------------------
g x :: b

##########################################

flip ::
flip f = g
    where g x = h
        where h y = (f y) x

flip :: (b -> (a -> c)) -> (a -> (b -> c))
f :: b -> (a -> c)
------------------------
flip f :: a -> (b -> c)

g :: a -> (b -> c)
x :: a
------------------------
g x :: b -> c

h :: b -> c
y :: b
-------------------------
h y :: c

f y :: a -> c
x :: a
--------------------------
(f y) x :: c

f :: b -> (a -> c)
y :: b 
-----------------------
f y :: a -> c
###############################################
subst ::
subst f = h
    where h g = k
        where k x = (f x) (g x)

subst :: (a -> (b -> c)) -> ((a -> b) -> (a -> c))
f :: a -> (b -> c)
-----------------------
subst f :: (a -> b) -> (a -> c)

h :: (a -> b) -> (a -> c)
g :: a -> b
------------------
h g :: a -> c

k :: a -> c
x :: a
--------------------
k x :: c

f x :: b -> c
g x :: b
-------------------
(f x) (g x) :: c

f :: a -> (b -> c)
x :: a
-----------------------
f x :: b -> c

g :: a -> b
x :: a
------------------------
g x :: b
```
