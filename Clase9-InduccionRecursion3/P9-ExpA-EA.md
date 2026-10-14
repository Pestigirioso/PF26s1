# Ejercicio 1
## b. demostrar
### i.
 ea2ExpA . expA2EA = id

 Por ppio de extensionalidad, es lo mismo demostrar que

¿ para todo x :: ExpA
    `ea2ExpA . expA2EA x = id x` ?

Sea e un expA cualquiera, por ppio de induccion sobre la estructura de e

Caso base) e = Cte n
¿ `ea2ExpA . expA2EA (Cte n) = id (Cte n)` ?

Caso Inductivo 1) e = Suma e1 e2
TI) ¿ `ea2ExpA . expA2EA (Suma e1 e2) = id (Suma e1 e2)` ?
HI1.1) ¡ `ea2ExpA . expA2EA e1 = id e1` !
HI1.2) ¡ `ea2ExpA . expA2EA e2 = id e2` !

Caso Inductivo 2) e = Prod e1 e2
TI) ¿ `ea2ExpA . expA2EA (Prod e1 e2) = id (Prod e1 e2)` ?
HI2.1) ¡ `ea2ExpA . expA2EA e1 = id e1` !
HI2.2) ¡ `ea2ExpA . expA2EA e2 = id e2` !

Caso base)
¿ `ea2ExpA . expA2EA (Cte n) = id (Cte n)` ?

Lado izquierdo
```
    ea2ExpA . expA2EA (Cte n)
=                           (.)
    ea2ExpA (expA2EA (Cte n))
=                           expA2EA.1
    ea2ExpA (Const x)
=                           ea2ExpA.1
    Cte x
```

Lado derecho
```
    id (Cte n)
=           id
    Cte n
```

Caso Inductivo 1)
TI) ¿ `ea2ExpA . expA2EA (Suma e1 e2) = id (Suma e1 e2)` ?

Lado izq.
```
    ea2ExpA . expA2EA (Suma e1 e2)
=                       (.)
    ea2ExpA (expA2EA (Suma e1 e2))
=                       expA2EA.2
    ea2ExpA (BOp Sum (expA2EA e1) (expA2EA e2))
=                       ea2ExpA.2
    bop2ExpA Sum (ea2ExpA (expA2EA e1)) (ea2ExpA (expA2EA e2))
=                       bop2ExpA.1
    Suma (ea2ExpA (expA2EA e1)) (ea2ExpA (expA2EA e2))
=                           (.)
    Suma (ea2ExpA . expA2EA e1) (ea2ExpA . expA2EA e2)
=                       HI1.1, HI1.2
    Suma (id e1) (id e2)
=                       id
    Suma e1 e2
```

Lado der.
