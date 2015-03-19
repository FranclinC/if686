module Main where

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
sumPairs (x:xs) [] = [x] ++ sumPairs xs []
sumPairs [] (y:ys) = [y] ++ sumPairs [] ys
sumPairs (x:xs) (y:ys) = [x + y] ++ (sumPairs xs ys)

quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = quicksort (filter (< x) xs) ++ [x] ++ quicksort (filter (>= x) xs)

main :: IO()
main = do
	putStrLn "double function!"
	putStrLn (show [1,2,3,4,5])
	putStrLn (show (double [1,2,3,4,5]))
	putStrLn "--"
	putStrLn "member function!"
	putStrLn (show [1,2,3,4,5])
	putStrLn (show (member [1,2,3,4,5] 5))
	putStrLn "--"
	putStrLn "digits function!"
	putStrLn (show "1a2b3c")
	putStrLn (show (digits "1a2b3c"))
	putStrLn "--"
	putStrLn "sumPairs function!"
	putStrLn "[1,2,3,4,5] [6,7,8,9,10]"
	putStrLn (show (sumPairs [1,2,3,4,5] [6,7,8,9,10]))
	putStrLn "--"
	putStrLn "quicksort function!"
	putStrLn (show [-1,1,100,43,12,0,424,53,99,98,97,-1000,12])
	putStrLn (show (quicksort [-1,1,100,43,12,0,424,53,99,98,97,-1000,12]))
	putStrLn "--"