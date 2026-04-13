# Currificación

Correspondencia 1 a 1 entre cada función que toma una tupla como argumento con una función que retorna una función intermedia que completa el trabajo.

Cada definición de f' se corresponde con una de la forma de f:

```haskell
f' :: (A, B) -> C               f :: A -> (B -> C)
f' (x, y) = e                   f x = g where g y = e
```

Esta correspondencia es una relación entre dos conjuntos: en un conjunto están las funciones que toman tuplas, y en el otro están las funciones que toman un elemento y devuelven una función.

- Las funciones de tipo `a -> (b -> c)` se dice que está ***currificada***
    - f' se descurrifica mediante `curry`, `(curry f') :: a -> (b -> c)`

- Las funciones de tipo `(a, b) -> c` se dice que está ***descurrificada*** o ***no currificada***
    - f se descurrifica con `uncurry`, `(uncurry f) :: (a, b) -> c`

Formas de definir a twice:

```haskell
twice f = g where g x = f (f x)
-- twice es una función que toma una función 
twice f = \x -> f (f x)
twice = \f -> (\x -> f (f x))
(twice f) x = f (f x)
```

Una regla que puedo usar para convertir funciones es la de "pasar argumentos":

```
f x y = e

// Paso la y

f x = \y -> e

// Paso la x

f = \x -> (\y -> e)
```

Y la inversa es:

```
f = \x -> (\y -> e)

// Paso la x

f x = \y -> e

// paso la y

(f x) y = e
```

Al ser la aplicación de funciones asociativa a izquierda, lo siguiente es equivalente: `(f x) y = f x y`, puedo "no poner" los paréntesis a izquierda en la aplicación.

`f` sigue siendo una función que toma `x` y devuelve una función que toma `y` y devuelve el resultado.

En cuanto al tipo de las funciones, es asociativa a derecha, es decir: `A -> (B -> C) = A -> B -> C`
Los paréntesis a derecha pueden ser invisibles.

Luego, leer en francés es decir que, en lugar de "f es una función que toma x y devuelve una función que toma y y devuelve un resultado", decimos que "f es una función que toma dos elementos y devuelve un resultado", aunque pensamos que cada función solo toma 1 elemento.


