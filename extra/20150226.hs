-- 1.
{-
    A. V
    B. F
    C. F
    D. V
    E. F
    F. F
    G. V
    H. F
    I. ?
    J. F
-}

-- 2.
map.(\x y z -> foldr y x z) func

map :: (a -> b) -> [a] -> [b]
(.) :: (y -> z) -> (x -> y) -> (x -> z)
foldr :: (t -> u -> u) -> u -> [t] -> u
func :: STM d -> IO d

-- 3.
mergesort :: [Int] -> [Int]
mergesort [] = []
mergesort [x] = [x]
mergesort list = merge (mergesort left) (mergesort right)
    where (left, right) = split list

split :: [Int] -> ([Int], [Int])
split list
  | (list == []) = ([], [])
  | ((length list) == 1) = (list, [])
  | otherwise = (x:xs, y:ys)
    where (xs, ys) = split (tail (tail list))
          x = head list
          y = head (tail list)

merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge xs@(x:xt) ys@(y:yt)
    | (x <= y) = x : merge xt ys
    | otherwise = y : merge xs yt
