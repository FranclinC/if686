-- 1.
{-
    Conteúdo não dado em sala!
-}

-- 2.
data Habitantes = Elfos String | Humanos String | Anoes String | Hobbits String deriving (Eq, Show)

class Comp a where
    maisImportante :: a -> a -> Bool

instance Comp Habitantes where
    maisImportante (Elfos _) (Humanos _) = True
    maisImportante (Humanos _) (Anoes _) = True
    maisImportante (Anoes _) (Hobbits _) = True
    maisImportante (Elfos a) (Elfos b) = a > b
    maisImportante (Humanos a) (Humanos b) = a > b
    maisImportante (Anoes a) (Anoes b) = a > b
    maisImportante (Hobbits a) (Hobbits b) = a > b
    maisImportante _ _ = False

-- 3.
data Tree t = Nil | Node (Tree t) t (Tree t) deriving (Eq, Show)

criarArvoreDeImportancia :: Ord t => [t] -> Tree t
criarArvoreDeImportancia [] = Nil
criarArvoreDeImportancia (h:t) = aux (Node Nil h Nil) t
    where aux tr [] = tr
          aux tr (h:t) = aux (insert tr h) t

insert :: Ord t => Tree t -> t -> Tree t
insert Nil x = Node Nil x Nil
insert (Node t1 v t2) x
    | (v == x) = Node t1 v t2
    | (v < x) = Node t1 v (insert t2 x)
    | otherwise = Node (insert t1 x) v t2

inorder :: Ord a => Tree a -> [a]
inorder Nil = []
inorder (Node t1 v t2) = inorder t1 ++ [v] ++ inorder t2

-- 4.
{-
(+ 2).((*) 2).(2 /)

(+ 2) :: Num a => a -> a
. :: (y -> z) -> (x -> y) -> (x -> z)
((*) 2) :: Num b => b -> b
. :: (u -> v) -> (t -> u) -> (t -> v)
(2 /) :: Fractional c => c -> c

(+ 2).((*) 2)
(y -> z)
y = a
z = a

(x -> y)
x = b
y = b

a = b


----
(.).filter

(.) :: (y -> z) -> (x -> y) -> (x -> z)
. :: (u -> v) -> (t -> u) -> (t -> v)
filter :: (a -> Bool) -> [a] -> [a]

(u -> v)
    u = (y -> z)
    v = (x -> y) -> (x -> z)
(t -> u)
    t = (a -> Bool)
    u = [a] -> [a]

(y -> z) = [a] -> [a]
y = [a]
z = [a]

v = (x -> [a]) -> (z -> [a])

(t -> v) = ((a -> Bool) -> (x -> [a]) -> (x -> [a]))
-}
