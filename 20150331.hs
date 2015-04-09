module Main where

import Data.Char

{- Quarto Trabalho de PLC -}

{- 1. Quando tratamos de polimorfismo em haskell, podemos garantir que ele é mais seguro quanto 
a garantia de que os tipos terão implementações das funcionalidades que serão utilizadas sob eles, 
pois é possível restringir que os argumentos genéricos possuam implementações de determinadas funções,
sendo esses definidos por uma classe. Em Java, o Generics que é utilizado no polimorfismo acaba 
sendo mais geral pois não restringe os dados, porém é mais sucetível à erro tendo em vista que apenas
ocorre uma verificação de tipo em tempo de execução.-}

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

{- Exercícios da monitoria em sala 31/03 -> bit.ly/1G3ePIQ -}

next :: Char -> Int -> [(Int,Int,Char)] -> Int
next _ _ [] = 0
next x b ((f, t, c):xs) 
	| x == c && f == b = t
	| otherwise = (next x b xs)

contain :: [Int] -> Int-> Bool
contain [] _ = False
contain (h:t) v 
	| h == v = True
	| otherwise = (contain t v)

afd :: String -> [Int] -> [(Int,Int,Char)] -> Int -> [Int] -> Bool
afd [] st tr b e = contain e b
afd (x:xs) st tr b e
	| ntst < 0 = False
	| otherwise = (afd xs st tr ntst e)
		where 
			ntst = next x b tr

toHex :: Int -> String
toHex t 
	| t < 16 = [intToDigit t]
	| otherwise = (toHex (div t 16)) ++ [(intToDigit (mod t 16))]

toDec :: String -> Int -> Int
toDec [] sz = 0
toDec (h:t) sz = (pow 16 (sz-1)) * (digitToInt h) + (toDec t (sz-1))
				
pow :: Int -> Int -> Int
pow a b 
	| b == 0 = 1
	| otherwise = a * (pow a (b-1)) 

aux :: [String] -> Int
aux [] = 0
aux (h:t) = toDec h $ length h + aux t

somatorioHexadecimal :: [String] -> String
somatorioHexadecimal l = toHex $ aux l

isP :: String -> String
isP l 	
	| ((mod len 2) == 0 && (reverse (take (div len 2) l)) == (drop (div len 2) l) ) = "PALINDROME" 
	| ((mod len 2) == 1 && (reverse (take (div len 2) l)) == (drop (div (len+1) 2) l )) = "PALINDROME"
	| otherwise = "NAO PALINDROME"
		where len = length l

palindromoDecimal :: String -> String
palindromoDecimal s = (show dec) ++ " - " ++ (isP (show dec))
					where dec = toDec s (length	s)

{- Exercícios do slide 03_POLIMORFISMO -}

take2 :: [t] -> Int -> [t]
take2 [] _ = []
take2 (h:t) n
	| (n == 0) = []
	| otherwise = [h] ++ take2 t (n - 1)

drop2 :: [t] -> Int -> [t]
drop2 [] _ = []
drop2 (h:t) n
	| n == 0 = [h] ++ (drop2 t n)
	| otherwise = drop2 t (n - 1)

takeWhile2 :: (t -> Bool) -> [t] -> [t]
takeWhile2 f t = [x | x <- t, f x]

dropWhile2 :: (t -> Bool) -> [t] -> [t]
dropWhile2 f t = [x | x <- t, not (f x)]

qsort :: (Ord t) => [t] -> [t]
qsort [] = []
qsort (h:t) = qsort ([x | x <- t, x < h]) ++ [h] ++ qsort ([x | x <- t, x >= h])

agrupar :: (Ord t) => [t] -> [(t, Int)]

main :: IO()
main = do
	putStrLn "I am the bad guy!"
	putStrLn $ show $ take2 [1, 2, 3, 4, 5] 3
	putStrLn $ show $ drop2 [1, 2, 3, 4, 5] 3
	putStrLn $ show $ takeWhile2 (> 10) [14, 13, 11, 9, 23]
	putStrLn $ show $ dropWhile2 (> 10) [14, 13, 11, 9, 23]
	putStrLn $ show $ qsort [14, 13, 11, 9, 23]
	putStrLn $ show $ agrupar ["Fernando", "Castor"]
