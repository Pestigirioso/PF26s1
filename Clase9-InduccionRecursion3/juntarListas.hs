juntarListasDeListas :: [[a]] -> [[a]] -> [[a]]
juntarListasDeListas [] yss = yss
juntarListasDeListas (xs:xss) yss = case yss of
                                        [] -> xs:xss
                                        (ys':yss') -> (xs ++ ys') : (juntarListasDeListas xss yss')
