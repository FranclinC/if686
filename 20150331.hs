module Main where

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
let node = ()
type graph = ()


{- Exercícios em sala 31/03 -> bit.ly/1G3ePIQ -}


main :: IO()
main = do
	putStrLn (show (lookAndSay 5))
