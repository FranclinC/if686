module Main where

(.).(.)

(.) :: (u -> v) -> (t -> u) -> (t -> v)
f == (.)

(.) :: (b -> c) -> (a -> b) -> (a -> c)
g == (.)

(.).(.) :: f.g
(u -> v) -> (t -> u) -> (t -> v)
(b -> c) -> (v -> b) -> (v -> c)
(t -> c)

main :: IO()
main = do
	putStrLn "Hello World"