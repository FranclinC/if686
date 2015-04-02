module Main where

{- Quinto trabalho de PLC enviado -}

import Data.Char

{- Exercícios do slide para o dia 07/04 -}

capitalize :: Char -> Char
capitalize ch = chr (ord ch + offset)
	where 
		offset = ord 'A' - ord 'a'

zipi :: [t] -> [u] -> [(t, u)]
zipi (a:as) (b:bs) = (a,b) : zipi as bs
zipi _ _ = []

len :: [Int] -> Int
len [] = 0
len (h:t) = 1 + len t

rev :: [Int] -> [Int]
rev [] = []
rev (h:t) = rev t ++ [h]

--rep :: Int -> [Char] -> [Char]
rep 0 ch = []
rep n ch = ch : rep (n - 1) ch

take2 :: [t] -> Int -> [t]
take2 [] _ = []
take2 (h:t) n
	| (n == 0) = []
	| otherwise = [h] ++ take2 t (n - 1)

drop2 :: Int -> [t] -> [t]
drop2 _ [] = []
drop2 n (h:t)


main = do
	putStrLn "the main entry point!"
	putStrLn $ show $ capitalize 'c'
	putStrLn $ show $ zipi [1, 2, 3] [4, 5, 6]
	putStrLn $ show $ len [1, 2, 3, 4]
	putStrLn $ show $ rev [1, 2, 3, 4]
	putStrLn $ show $ rep 5 "LOL"
	putStrLn $ show $ take2 [1, 2, 3, 4, 5, 6, 7, 8] 4
	putStrLn $ show $ drop2 [1, 2, 3, 4, 5, 6, 7, 8] 4


