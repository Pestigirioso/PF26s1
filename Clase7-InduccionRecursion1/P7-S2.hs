type Nombre = String

data Planilla = Fin | Registro Nombre Planilla deriving Show

data Equipo
  = Becario Nombre
  | Investigador Nombre Equipo Equipo Equipo deriving Show

pl1 = Registro "Alan Turing" (Registro "Alonzo Church" (Registro "Ada Lovelace" Fin))
pl2 = Registro "Haskell Curry" (Registro "Pepito" (Registro "Monchito" (Registro "Juanita" Fin)))

eq1 = Investigador "Director Generico"
    (Investigador "Lider Proyecto A"
       (Becario "Becario 1")
       (Becario "Becario 2")
       (Becario "Becario 3"))
    (Becario "Becario Suelto 1")
    (Becario "Becario Suelto 2")

eq2 = Investigador "Dra. Ciencia"
    (Becario "Asistente Directo")
    (Investigador "Dr. Fisica"
       (Becario "Pasante Lab")
       (Investigador "Lic. Quark"
          (Becario "Becario Estudiante A") -- ¡Nivel 4 alcanzado aquí!
          (Becario "Becario Estudiante B")
          (Becario "Becario Estudiante C"))
       (Becario "Tecnico Lab"))
    (Investigador "Dra. Quimica"
       (Becario "Becario X")
       (Becario "Becario Y")
       (Becario "Becario Z"))

-- Planilla
-- f Fin = ...
-- f (Registro n p) = ... n ... f p ...

-- Equipo
-- g (Becario n) = ... n ...
-- g (Investigador n e1 e2 e3) = ... n ... g e1 ... g e2 ... g e3 ...

-- Ejercicio 3

-- a.
largoDePlanilla :: Planilla -> Int
largoDePlanilla Fin = 0
largoDePlanilla (Registro n p) = 1 + largoDePlanilla p

-- b.
esta :: Nombre -> Planilla -> Bool
esta n Fin = False
esta n (Registro m p) = n == m || esta n p

-- c.
juntarPlanillas :: Planilla -> Planilla -> Planilla
juntarPlanillas Fin p2 = p2
juntarPlanillas (Registro n p) p2 = Registro n (juntarPlanillas p p2)

-- d.
nivelesJerarquicos :: Equipo -> Int
nivelesJerarquicos (Becario n) = 0
nivelesJerarquicos (Investigador n e1 e2 e3) = 1
  + nivelesJerarquicos e1
  + nivelesJerarquicos e2
  + nivelesJerarquicos e3

-- e.
cantidadDeIntegrantes :: Equipo -> Int
cantidadDeIntegrantes (Becario n) = 1
cantidadDeIntegrantes (Investigador n e1 e2 e3) = 1 + cantidadDeIntegrantes e1 + cantidadDeIntegrantes e2 + cantidadDeIntegrantes e3

-- f.
planillaDeIntegrantes :: Equipo -> Planilla
planillaDeIntegrantes (Becario n) = Registro n Fin
planillaDeIntegrantes (Investigador n e1 e2 e3) = Registro n (
    juntarPlanillas (juntarPlanillas (planillaDeIntegrantes e1)
        (planillaDeIntegrantes e2))
    (planillaDeIntegrantes e3))
