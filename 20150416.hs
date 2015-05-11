-- AULA 06

-- TRABALHO 08

aux :: (Ord t, Num t) => [t] -> [t] -> [[t]]
aux a [] = [a]
aux a (h:t) = [[x | x <- a, x <= h]] ++ (aux [x | x <- a, x > h] t)

divi :: (Ord t, Num t) => [t] -> [t] -> [[t]]
divi x y = [a | a <- (aux y x), a /= []]

listPartitioner :: (Ord t, Num t) => [t] -> ([t] -> [[t]])
listPartitioner list = \x -> (divi (sort list) (sort x))