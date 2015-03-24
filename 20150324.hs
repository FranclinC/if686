-- Mergesort, by rav2

-- recebe duas listas ordenadas e retorna uma lista nova
-- que é o agrupamento das duas, ordenadas
merge []         ys                   = ys
merge xs         []                   = xs
merge xs@(x:xt) ys@(y:yt) | x <= y    = x : merge xt ys
                          | otherwise = y : merge xs yt

-- decompôe recursivamente a lista
split :: [Int] -> ([Int], [Int])
split list
  | (==) list [] = ([], [])
  | (==) (length list) 1 = (list, [])
  | otherwise = (x: xs, y: ys)
  where
    (xs, ys) = split (tail (tail list))
    x = head list
    y = head (tail list)

-- decompôe, ordena e reagrupa a lista
mergesort :: [Int] -> [Int]
mergesort [x] = [x]
mergesort xs  = let (as, bs) = split xs
                in merge (mergesort as) (mergesort bs)


--Heapsort

import Data.List

swap :: Int -> Int -> [a] -> [a]
swap i j xs | i == j    = xs
swap i j xs | otherwise = initial ++ (xs !! b) : middle ++ (xs !! a) : end 
    where [a,b] = sort [i,j]
          initial = take a xs
          middle  = take (b-a-1) (drop (a+1) xs)
          end     = drop (b+1) xs

largest :: Ord a => Int -> Int -> [a] -> Int
largest i hs xs = 
        let large = if (l < hs) && ((xs !! l) > (xs !! i)) then l else i
        in if (r < hs) && ((xs !! r) > (xs !! large)) then r else large
        where l = 2 * i + 1
              r = 2 * i + 2

heapify :: Ord a => Int -> Int -> [a] -> [a]
heapify i hs xs = 
        if (large /= i) then heapify large hs (swap large i xs)
        else xs
        where large = largest i hs xs

buildheap :: Ord a => Int -> [a] -> [a]
buildheap 0 xs = heapify 0 (length xs) xs
buildheap i xs = buildheap (i - 1) (heapify i (length xs) xs)

hpsort i xs = let swapped = swap 0 i xs
              in if i /= 1 then hpsort (i - 1) (heapify 0 i swapped)
                 else (heapify 0 i swapped)

heapsort xs = let heap = buildheap (length xs `div` 2) xs
              in heapsorting (length xs - 1) heap

--

main :: IO()
main = do
	putStrLn (show [16,4,10,14,7,9,3,2,8])
	putStrLn (show (heapsort [16,4,10,14,7,9,3,2,8]))
