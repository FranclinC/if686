-- TRABALHO 06

-- 1.
data G t = NilT | [(t, [t])] deriving (Eq, Show)

-- 2.
dfs :: Eq t => G t -> t -> t -> Bool
dfs G from to = dfs' G [from] [] to

getNodes :: Eq t => G t -> t -> [t]
getNodes (G ls adj) f = [y | (x,y,z) <- adj, x == f]

search :: Eq t => G t -> t -> Bool
search (G ls adj) f = (length [x | x <- all, x == True]) > 0
	where
		G = (G ls adj)
		all = [dfs G x f | x <- ls]

dfs' :: Eq t => G t -> [t] -> [t] -> t -> Bool
dfs' _ [] _ _ = False
dfs' (G ls adj) (a:as) vis f
	| a == f = True
	| isVis vis a = dfs' G as vis f
	| otherwise = dfs' G stack nIsVis f
		where
			G = G ls adj
			stack = (getNodes G a) ++ as
			nIsVis = a:vis

isVis :: Eq t => [t] -> t -> Bool
isVis ls n = (length [x | x <- ls, x == n]) > 0

databases :: G Char
databases = G ['a', 'b', 'c', 'd'] [('a', 'b', 2), ('a', 'c', 3), ('c', 'd', 9), ('b', 'a', 0)]