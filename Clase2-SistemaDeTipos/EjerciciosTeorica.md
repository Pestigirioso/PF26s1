# Ejercicio 0

```haskell
doble ::
doble x = x + x

id :: 
id x = x

suma :: 
suma x = g
    where g y = x + y

const ::
const x = g
    where g y = x

twice ::
twice f = g
    where g x = f (f x)

compose ::
compose f = h
    where h g = k
        where k x = f (g x)

flip :: 
flip f = g
    where g x = h
        where h y = (f y) x

subst ::
subst f = h
    where h g = k
        where k x = (f x) (g x)
```

## Ejercicio 1
### Dar el valor de las siguientes expresiones

```
a) (\f -> f 2 + f 4) id
b) (\f -> f 2 + f 4) doble
c) (\f -> f 2 + f 4) (suma 17)
d) (\f -> f 2 + f 4) (const 21)
```

## Ejercicio 2
### Mostrar la reducción de

```
a) (suma 2) 3
b) ((subst const) suma) 17
c) ((subst const) twice) doble
```

## Ejercicio 3
### A partir de las reducciones anteriores, construir expresiones equivalentes para

```
a) ((subst const) suma)
b) \f -> (subst const) f
```

## Ejercicio 4
### Dar expresiones equivalentes que no nombren a las funciones definidas

```
a) id
b) const
c) flip
```

## Ejercicio 5
### Completar la definicion de la funcion `yTambien` de forma tal que `b1` y `b2`, `(yTambien b1) b2 = b1 && b2`

```haskell
yTambien::
yTambien b = if b then ??
                  else ??
```

## Ejercicio 6
### Mostrar la reducción de
```haskell
((subst (flip apply))suma)17
```

## Ejercicio 7
### A partir de la reducción anterior dar una expresión equivalente para
```haskell
(subst(flip apply))suma
```

## Ejercicio 1 clase 2
### Dar los tipos para TODAS las funciones definidas en los ejercicios anteriores.
