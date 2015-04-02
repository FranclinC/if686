module Main where

{- Terceiro Trabalho de PLC -}

-- HashTable
type Key = Int
type Value = Int
type HashTable = [(Key, Value)]

database :: HashTable
database = [(21,4),(212,43),(34,336),(14,3422),(2,5),(8,3),(7,1),(12,8),(16,3),(10,2),(2,4),(1,4),(3,6),(4,2),(2,5),(8,3),(7,1),(12,8),(16,3),(10,2)]

get :: HashTable -> Int -> Int
get [] key = -1
get h key 
	| hasKey h key == False = -1
	| otherwise = snd (h!!(collision h key 0))

put :: HashTable -> Int -> Int -> HashTable
put h key value
 	| (hasKey h key == False) = (take (collision h 0 0) h) ++ [(key, value)] ++ (drop ((collision h 0 0) + 1) h)
 	| otherwise = (take (collision h key 0) h) ++ [(key, value)] ++ (drop ((collision h key 0) + 1) h)

remove :: HashTable -> Int -> HashTable
remove h key
 	| not (hasKey h key) = error "error"
 	| otherwise = (take (collision h key 0) h) ++ [(0, 0)] ++ (drop ((collision h key 0) + 1) h) 

hasKey :: HashTable -> Int -> Bool
hasKey [] _ = False
hasKey (x:xs) key
 	| (fst x == key) = True
 	| otherwise = hasKey xs key

collision :: HashTable -> Int -> Int -> Int -- linear probing
collision h key s
 	| (fst (h!!(p)) == key) = p
 	| otherwise = collision h key (s + 3)
 	where 
 		p = (key + s) `mod` (length database)

-- Comparação de Conjuntos
comparaConjuntos :: (Eq t) => [t] -> [t] -> String
comparaConjuntos a b
	| ((contains a b) && (contains b a)) = "A igual B"
	| (contains a b) = "A contem B"
	| (contains b a) = "B contem A"
	| (intersection a b) = "A intersecta B"
	| otherwise = "Conjuntos Disjuntos"

contains :: (Eq) => [t] -> [t] -> Bool
contains _ [] = True
contains a (b:bs) = ((check b a) && (contains a bs))

intersection :: (Eq t) => [t] -> [t] -> Bool
intersection _ [] = False
intersection a (b:bs) = ((check b a) || (intersection a bs))

check :: (Eq t) => t -> [t] -> Bool
check v [] = False
check v (x:xs)
	| (v == x) = True
	| otherwise = (check v xs)

main :: IO()
main = do
	putStrLn "I'm not in danger. I am the danger!"
	putStrLn $ comparaConjuntos [1, 2, 3, 4] [1, 2, 5, 6]
