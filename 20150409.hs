-- TRABALHO 06

-- 1.
data Graph t = NilT | [(t, [t])] deriving (Eq, Show)

-- 2.
dfs :: (Eq t, Show t) => Graph t -> t -> Bool