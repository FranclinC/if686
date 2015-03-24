module Main where

{- Exercícios do slide-}

menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior a b c = (min (min a b) c, max (max a b) c)

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)

main :: IO()
main = do
	putStrLn (show [12314, 77, 21, 1, 11, 111, 0, 89, 231])
	putStrLn (show (heapsort [12314, 77, 21, 1, 11, 111, 0, 89, 231]))
	
