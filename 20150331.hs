module Main where

import Data.Char

{- Quarto Trabalho de PLC -}

{-
1. Poliformismo em Haskell 
-}

-- 2.
lookAndSay :: Int -> Int
lookAndSay n = read (iterate las "1" !! n)

las s = display $ foldl calculate ("", 0, '0') s

calculate :: (String, Int, Char) -> Char -> (String, Int, Char)
calculate (xs, 0, '0') x = (xs, 1, x)
calculate (xs, n, y) x
	| (x == y) = (xs, n + 1, y)
	| otherwise = (display (xs, n, y), 1, x)

display (xs, n, y) = xs ++ (show n) ++ (y:"")

-- 3.

-- 4.

{- Exercícios em sala 31/03 -> bit.ly/1G3ePIQ -}

-- 1.
--afd :: [Char] -> [Int] -> [(Int, Int, String)] -> Int -> [Int] -> Bool
--afd [] (list:t1) ((curr, next, tran):t2) ini acc = (elem ini acc)
--afd (state:t1) (list:t2) ((curr, next, tran):t3) ini (acc:t4) 

afd :: String -> [Int] -> [(Int, Int, Char)] -> Int -> [Int] -> Bool
afd [] _ _ _ _ = False
afd input states trans initial acc = simulate states trans acc [(input,initial)] 

simulate :: [Int] -> [(Int, Int, Char)] -> [Int] -> [(String,Int)] -> Bool
simulate _ _ _ [] = False
simulate states trans acc ((input, actual):as)
	| ((input, actual):as) == [] = False
	| [actual] == [x | x <- acc, x == actual] = True
	| otherwise = simulate states trans acc ([(tail input, y) | (x,y,z) <- trans, x == actual && z == head input] ++ as) 


-- 2.
somatorioHexadecimal :: [String] -> Int
somatorioHexadecimal [] = 0
somatorioHexadecimal (h:t) = (cnv h + (somatorioHexadecimal t))

cnv :: String -> Int
cnv [] = 0
cnv (h:t) = (digitToInt h) + (cnv t)

-- 3.

-- 4.
type Vector = [Double]
type Matrix = [Vector]

--multiplicaMatrizes :: [[Int]] -> [[Int]] -> [[Int]]
--multiplicaMatrizes ((x:xs):t1) ((y:ys):t2) = 
	
main :: IO()
main = do
	putStrLn "The main entry point!"
	putStrLn $ afd "111" [1, 2, 3] [(1, 1, "1"), (1, 3, "0"), (3, 2, "1")] 1 [2]
	--putStrLn $ show (somatorioHexadecimal ["A", "B", "C", "D", "E", "F"])
	--putStrLn $ multiplicaMatrizes [[1, 2], [3, 4]] [[4, 3], [2, 1]]

