# Currificación

## Ejercicios para arrancar

1) Pasarlas a notación en francés
a) con todos los paréntesis visibles
b) con máxima cantidad de paréntesis invisibles

Ejemplo:

```haskell
a)
suma :: Int -> (Int -> Int)
(suma x) y = x + y

b)
suma :: Int -> Int -> Int
suma x y = x + y
```

```haskell
suma :: Int -> (Int -> Int)
suma x = g
    where g y = x + y

apply :: 
apply f = g
    where g x = f x
    
a) 
apply :: (a -> b) -> (a -> b)
(apply f) x = f x

b) apply :: (a -> b) -> a -> b
apply f x = f x
    
const ::
const x = g
    where g y = x

a)
const :: a -> (b -> a)
(const x) y = x

b)
const :: a -> b -> a
const x y = x

twice ::
twice f = g
    where g y = f (f y)

a)
twice :: (a -> a) -> (a -> a)
(twice f) x = f (f x)

b)
twice :: (a -> a) -> a -> a
twice f x = f (f x)

compose ::
compose f = h
    where h g = k
        where k x = f (g x)

a) compose :: 

flip ::
flip f = g
    where g x = h
        where h y = (f y) x
        
subst ::
subst f = h
    where h = g = k
        where k x = (f x) (g x)
```

2) Para cada una de las siguientes expresiones:

i) suma . doble 2
ii) doble . suma 2
iii) doble . doble 2

a) Agregar todos los paréntesis necesarios para que la expresión tenga tipo
b) Dar el tipo de la expresión
c) Escribir la misma expresión con máxima cantidad de paréntesis invisibles
d) Dar una expresión atómica equivalente

-----
```
(f e) e' != f (e e')
   =
f e e'
```

En el caso de los tipos:
```
A -> (B -> C) "es distinto de" (A -> B) -> C
es igual a
A -> B -> C
```

### Sección de operadores

En el caso `2 + 3`, el `+` es un operador. Un operador **NO PUEDE** _no_ tener nada alrededor, pero si quiero hablar de "La función que representa el `+` tengo que usar sección de operadores.

En el caso de los operadores, al ser los más importantes, son los últimos que se resuelven. Por ejemplo, `doble 2 + 3` es lo mismo que `(doble 2) + 3`, que me da 7. En caso de que quiera que me de 10, debo escribir `doble (2+3)`

## Más cosas
Las siguientes expresiones son equivalentes:

```
f x = e
<=>
f = \x -> e
```
