Module Main where

{- Exercícios do slide -}

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

--generateFiboPairs :: Int -> [Int]

--ordDigits :: [Int] -> [Int]

type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

--pontoY :: Float -> Reta -> Float

main :: IO()
main = do
	putStrLn "Yo, bitch!"