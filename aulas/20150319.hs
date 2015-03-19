module Main where

double :: [Int] -> [Int]
double [] = []
double l:ls = [l * 2] ++ double ls

member :: [Int] -> Int -> Bool
member [] v = FALSE
member l:ls v
	| (l == v) = TRUE
	| otherwise = member (ls v)

digits :: String -> String


sumPairs :: [Int] -> [Int] -> [Int]
sumPairs [] = []
sumPairs x:xs y:ys = [x + y] ++ sumPairs xs ys

main :: IO()
main = do
	putStrLn (show [1,2,3,4,5])
	putStrLn (show (double [1,2,3,4,5]))
	putStrLn "--"
	putStrLn (show [1,2,3,4,5] "5")
	putStrLn (show (member [1,2,3,4,5] 5))
	putStrLn "--"
	putStrLn (show [1,2,3,4,5] "5")
	putStrLn (show (digits [1,2,3,4,5] 5))
	putStrLn "--"
	putStrLn (show [1,2,3,4,5] [6,7,8,9,10])
	putStrLn (show (sumPairs [1,2,3,4,5] [6,7,8,9,10]))