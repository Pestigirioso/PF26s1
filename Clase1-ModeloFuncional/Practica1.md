# Ejercicio 2
```
    doble (doble 2)
->                      (def de doble, con x <- doble 2)
    doble 2 + doble 2
->                      (def de doble, con x <- 2)
    2 + 2 + doble 2
->                      (def de doble, con x <- 2)
    2 + 2 + 2 + 2
->                      (aritm)
    8
```

# Ejercicio 3

```
    cuadruple 2
->              (def cuadruple, con x <- 2)
    4 * 2
->              (aritm)      
    8
```
```
    cuadruple (cuadruple 2)
->                          (def cuadruple, con x <- cuadruple 2)
    4 * (cuadruple 2)
->                          (def cuadruple, con x <- 2)
    4 * (4 * 2)
->                          (aritm)
    32
```
La segunda expresión, `cuadruple (cuadruple 2)` se puede hacer de varias maneras

# Ejercicio 5

```
    twice succ
->              (def twice, con f <- succ)
    g
```

