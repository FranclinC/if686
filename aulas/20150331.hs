-- AULA 03

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