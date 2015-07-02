-- AULA 01

qtdSemanas :: Int -> Int -> Int
qtdSemanas _ 0 = 0
qtdSemanas s n
	| s == vendas 3 = 1 + qtdSemanas s (n - 1)
	| otherwise = qtdSemanas s (n - 1)

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

ordNum :: [Int] -> [Int]
ordNum [] = []
ordNum (h:t) = ordNum [y | y <- t, su y < su h] ++ [h] ++ ordNum [y | y <- t, su y >= su h]

su :: Int -> Int
su 0 = 0
su n = mod n 10 + su (div n 10)