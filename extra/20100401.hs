-- Lista 1, 2010.1
module Main where

-- 1.
itemN :: Int -> [t] -> t
itemN n xs = xs !! (n - 1)

-- 2.
elemento :: (Eq t) => t -> [t] -> Bool
elemento n [] = False
elemento n (x:xs)
	| (n == x) = True
	| otherwise = (elemento n xs)

-- 3.
ocorrenciasN :: (Eq t) => t -> [t] -> Int
ocorrenciasN n [] = 0
ocorrenciasN n (x:xs)
	| (n == x) = 1 + (ocorrenciasN n xs)
	| otherwise = (ocorrenciasN n xs)

-- 4.
only1 :: (Eq t) => t -> [t] -> Bool
only1 n [] = False
only1 n xs = ((count n xs) == 1)

count :: (Eq t) => t -> [t] -> Int
count n [] = 0
count n (x:xs)
	| (n == x) = 1 + (count n xs)
	| otherwise = (count n xs)

-- 5.
parImpar :: [Int] -> ([Int], [Int])
parImpar [] = ([], [])
parImpar x = (p, i)
	where
		p = [a | a <- x, a `mod` 2 == 0]
		i = [a | a <- x, a `mod` 2 == 1]

-- 6.
estaOrdenado :: [Int] -> Bool
estaOrdenado [] = True
estaOrdenado (x:y:xs)
	| (x < y) = (estaOrdenado xs)
	| otherwise = False

-- 7.
sort :: [Int] -> [Int] -- yeah! bad quicksort :P
sort [] = []
sort (x:xs) = sort (filter (< x) xs) ++ [x] ++ sort (filter (>= x) xs)

-- 8.
getWord :: String -> String
getWord [] = []
getWord (x:xs)
	| (x >= 'a' && x <= 'z' || x >= 'A' && x <= 'Z') = [x] ++ (getWord xs)
	| otherwise = []

-- 9.
crivo :: Int -> [Int]
crivo n = filter isPrime [2..n]

isPrime :: Int -> Bool
isPrime n = check 2
	where
		check d
			| ((d * d) > n) = True
			| ((n `rem` d) == 0) = False
			| otherwise = check (d + 1)

-- 10.
split :: (Int -> Bool) -> [Int] -> ([Int], [Int])
split f x = (tr, fa)
	where
		tr = [a | a <- x, f a]
		fa = [a | a <- x, not (f a)]

-- 11.
combinar :: (Integral a, Integral b, Num c) => ((a, b) -> c) -> [a] -> [b] -> [c]
combinar f [] [] = []
combinar f [] (h:t) = [fromIntegral h] ++ (combinar f [] t)
combinar f (h:t) [] = [fromIntegral h] ++ (combinar f t [])
combinar f (h1:t1) (h2:t2) = (f (h1, h2)) : (combinar f t1 t2)

-- 12.

main :: IO()
main = do
	putStrLn "What's wrong with you?"
	putStrLn (show (itemN 2 ["primeiro", "segundo", "terceiro"]))
	putStrLn (show (elemento 2 [1, 2, 3]))
	putStrLn (show (ocorrenciasN 0 [0, 1, 0, 2, 0, 3]))
	putStrLn (show (only1 5 [5, 1, 2, 3, 4]))
	putStrLn (show (parImpar [1, 2, 3, 4, 5]))
	putStrLn (show (estaOrdenado [1, 2, 3, 2]))
	putStrLn (show (sort [65, 1, 11, 0, 1412, 11, -12314]))
	putStrLn (show (getWord "Ola, Mundo!"))
	putStrLn (show (crivo 50))
	putStrLn (show (split (>5) [1, 2, 3, 4, 5, 6, 7, 8, 9]))
	putStrLn $ show $ combinar (\(x, y) -> 2 * x + 3 * y) [1, 2, 3] [1, 2, 3, 4]
	putStrLn $ show $ foldi (-) 0 [1, 2, 3, 4, 5, 6, 7]
