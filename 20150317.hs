module Main where

{- Exercícios do slide -}

vendas :: Int -> Int
vendas x = 1

totalVendas :: Int -> Int
totalVendas n
	| (n == 0) = vendas 0
	| otherwise = totalVendas (n - 1) + vendas n

maxVendas :: Int -> Int
maxVendas n
	| (n == 0) = vendas 0
	| otherwise = max (maxVendas (n - 1)) (vendas n)

double :: [Int] -> [Int]
double [] = []
double (l:ls) = [l * 2] ++ double ls

member :: [Int] -> Int -> Bool
member [] _ = False
member (l:ls) v
	| (l == v) = True
	| otherwise = (member ls v)

digits :: String -> String
digits [] = []
digits (x:xs) 
	| (x >= '0' && x <= '9') = [x] ++ (digits xs)
	| otherwise = (digits xs)

sumPairs :: [Int] -> [Int] -> [Int]
sumPairs [] [] = []
sumPairs (x:xs) [] = [x] ++ (sumPairs xs [])
sumPairs [] (y:ys) = [y] ++ (sumPairs [] ys)
sumPairs (x:xs) (y:ys) = [x + y] ++ (sumPairs xs ys)

quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = quicksort (filter (< x) xs) ++ [x] ++ quicksort (filter (>= x) xs)

fib :: Int -> [Int]
fib 0 = [0]
fib 1 = [1, 0]
fib n = (head (fib (n - 1)) + head (fib (n - 2))) : fib (n - 1)

main :: IO()
main = do
	putStrLn "Yo, bitch!"
	putStrLn (show (fib 10))
