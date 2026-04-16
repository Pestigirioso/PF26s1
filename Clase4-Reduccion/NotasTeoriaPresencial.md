# Ejercicios en clase

1. Establecer el tipo de `(.)(.)(.)`
2. Dar una expresión atómica equivalente que no use (.) (ni compose).
    Sugerencia: completar con parámetros y usarlos, usando el ejercicio anterior como guia y reducir el cuerpo de la función resultado
3. Determinar si `(.)(.)(.) succ div` es parcial o total.
4. Determinar si `(.)(.)(.)` es parcial o total
5. Determinar si `yTambien` de la clase 1 estricta o no estricta.

## Funciones parciales
Una función parcial es una función que toma algo totalmente definido y me devuelve bottom

## Funciones estrictas
Una función estricta es una función que cuando recibe bottom(_|_), siempre devuelve bottom. Esto es porque una función estricta **necesita** de sus argumentos, ejemplo `suma`
Una función no estricta, es una función que cuando recibe bottom puede devolver algo distinto de bottom ej `const`, que es estricta con su primer argumento pero no con el segundo.
