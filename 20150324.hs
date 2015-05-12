-- TRABALHO 02

-- Mergesort, by rodrigo alves vieira

-- recebe duas listas ordenadas e retorna uma lista nova
-- que é o agrupamento das duas, ordenadas
merge [] ys = ys
merge xs [] = xs
merge xs@(x:xt) ys@(y:yt) 
	| (x <= y) = x : merge xt ys
	| otherwise = y : merge xs yt

-- decompôe recursivamente a lista
split :: [Int] -> ([Int], [Int])
split list
  	| (list == []) = ([], [])
  	| ((length list) == 1) = (list, [])
  	| otherwise = (x: xs, y: ys)
  	where
		(xs, ys) = split (tail (tail list))
		x = head list
		y = head (tail list)

-- decompõe, ordena e reagrupa a lista
mergesort :: [Int] -> [Int]
mergesort [x] = [x]
mergesort xs = let (as, bs) = split xs in merge (mergesort as) (mergesort bs)

-- heapsort
add:: Int -> [Int] -> [Int]
add n hp
	| hp==[] = [n]
	| otherwise = (bubbleUp (hp ++ [n]) ((length hp)) 0)

bubbleUp :: [Int] -> Int -> Int -> [Int]
bubbleUp [] l p  = []
bubbleUp (h:t) l p 
	| t == [] || var >= (length t) = (h:t) 
	| tmp == (l) && (h < (t!!var)) = ([(t!!var)] ++ (take (l-p-1) t)) ++ [h] ++ (drop (l-p) t)
	| esp == (l) && h < (t!!var) = ([t!!var] ++ (take (l-p-1) t)) ++ [h] ++ (drop (l-p) t)
	| tmp == (l) || esp == (l) = h:t
	| (l)>esp = (bubbleUp (bubbleUp (h:(bubbleUp t l (p+1))) tmp p) esp p)
	| (l)>tmp = (bubbleUp (h:(bubbleUp t l (p+1))) tmp p)
	| otherwise =  h:(bubbleUp t l (p+1)) 
		where
			tmp = ((2*p)+1)
			var = ((l-p)-1)
			esp = ((2*p)+2)


erase :: [Int] -> [Int]
erase [] = []
erase [x] = []
erase [x,y] = [y]
erase (x:y:z:xs) 
	| z > y = (add y (z:xs))
	| otherwise = (add z (y:xs))

sort :: [Int] -> [Int]
sort [] = []
sort x = (sort (erase x))  ++  [(head x)]
		
buildHeap:: [Int] -> [Int] -> [Int]
buildHeap [] hp  = hp
buildHeap (h:t) hp = buildHeap t (add h hp)

heapsort:: [Int] -> [Int]
heapsort x = sort (buildHeap x [])