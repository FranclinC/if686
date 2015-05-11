-- AULA 05

import Data.Char

sqrt2 :: [Float] -> [Float]
sqrt2 t = map sqrt t

alfa :: String -> Int
alfa c
    | 'a' <= c && 'z' >= c = ((ord c) - ba) + 1
    | 'A' <= c && 'Z' >= c = ((ord c) - bA) + 1
    | otherwise = -1
    where
        ba = ord 'a'
        bA = ord 'A'

posicaoAlfabeto :: String -> [Int]
posicaoAlfabeto s = mapi alfa s

mapi :: (a -> b) -> [a] -> [b]
mapi f l = [f x | x <- l]

member :: (Eq t) => t -> [t] -> Bool
member v ls = foldr (func v) False ls

func :: (Eq t) => t -> t -> Bool -> Bool
func a v b = v == a || b

union :: (Eq t) => [t] -> [t] -> [t]
union [] l = l
union (h:t) l = (foldr (func2) (h:t) l)

func2 :: (Eq t) => t -> [t] -> [t]
func2 _ [] = v:[]
func2 v (h:t)
    | v == h = v:t
    | otherwise = h:(func2 v t)

somaElem :: [String] -> [Int]
somaElem [] = []
somaElem (h:t) = (foldr (+) 0 (posicaoAlfabeto h)): somaElem t

data Tree t = NilT | Tree t (Tree t) (Tree t) deriving (Eq, Ord, Show)

criarArvore :: (Ord t) => [t] -> (Tree t -> t -> Tree t) -> Tree t

inter :: [t] -> [t] -> [t]

diff :: [t] -> [t] -> [t]

mapfilter

-- TRABALHO 06

-- 1.
--data Graph t = NilT | [(t, [t])] deriving (Eq, Show)

-- 2.
--dfs :: (Eq t, Show t) => Graph t -> t -> Bool