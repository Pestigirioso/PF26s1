Denotacional = (verde) Significa ES
Operacional :: -> (azul) significa SE EJECUTA A

Durante reducciones <- Significa REEMPLAZA A

## Forma para escribir reducciones

```
   | doble 2 |
-> |         |  (doble, x <- 2)
   | 2 + 2   |
-> |         |  (aritm)
   | 4       |
```

Hasta la clase 6, nada que tenga 3 cosas va sin paréntesis, ejemplo:

Si bien `suma 2 3` va a funcionar, debemos escribir `(suma 2) 3`

Sin embargo, si hay una función con un argumento solo, no usamos paréntesis: `suma (2)` está mal, escribimos `suma 2`, nada más.

Otra cosa a tener en cuenta, es que `doble (doble 2)` es equivalente a `8` y se pueden relacionar por reducción, sin embargo, por reducción no puedo llegar a `7 + 1` desde `doble (doble 2)`, a pesar de ser equivalentes.
Por otro lado, `doble` y `\x -> x + x` no se vinculan por reducción, a pesar de representar lo mismo.

Para las funciones anónimas, usamos la regla Beta, para reemplazar una variable por un valor.

Ej:

```
    (\x -> x + x)
->                  (beta, x <- 2)
    2 + 2
->                  (aritmetica)
    4
```

```
    (twice doble) 2
->                  (twice, f <- doble) -- Esto significa que cuando la pc ve f, lo reemplaza por doble
    g 2             (donde g x = doble (doble x))
->                  (g, x <- 2)
    doble(doble 2)
```

## Sistemas de tipos

f :: A -> B
e :: A
------------
f e :: B
