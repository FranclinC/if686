module Main where

{- Exercícios do slide 02_TUPLAS_CASAMENTO_PADROES -}

type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)
type Pessoa = String
type Livro = String
type BD = [(Pessoa, Livro)]
type Word = String
type Line = [Word]

menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior a b c = (min (min a b) c, max (max a b) c)

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (a, b, c) = (menor, (a + b + c) - maior - menor, maior)
	where 
		menor = (min (min a b) c)
		maior = (max (max a b) c)

fstCo :: Ponto -> Float
fstCo  (x, _) = x

sndCo :: Ponto -> Float
sndCo (_, y) = y

retaV :: Reta -> Bool
retaV ((x1,y1), (x2,y2))
	| (x1 == x2) = True
	| otherwise = False

database :: BD
database = [("sergio","O senhor dos aneis"), ("Andre", "Duna"), ("Fernando", "Jonhatan e something")]

livros :: BD -> Pessoa -> [Livro]
livros (x:xs) p
	| (fst x == p) = [snd x] ++ (livros xs p)
	| otherwise = (livros xs p)

emprestimos :: BD -> Livro -> [Pessoa]
emprestimos [] _ = []
emprestimos (x:xs) l
	| (snd x == l) = [fst x] ++ (emprestimos xs l)
	| otherwise = (emprestimos xs l)

emprestado :: BD -> Livro -> Bool
emprestado [] _ = False
emprestado (x:xs) l
	| (snd x == l) = True
	| otherwise = (emprestado xs l)

qtdEmprestimos :: BD -> Pessoa -> Int
qtdEmprestimos [] _ = 0
qtdEmprestimos (x:xs) p
	| (fst x == p) = 1 + (qtdEmprestimos xs p)
	| otherwise = (qtdEmprestimos xs p)

emprestar :: BD -> Pessoa -> Livro -> BD
emprestar b p l = b ++ [p,l]

devolver :: BD -> Pessoa -> Livro -> BD
devolver (x:xs) p l
	| (p == (fst x) && l == (snd x)) = (devolver xs p l)
	| otherwise = (x):(devolver xs p l)

livros2 :: BD -> Pessoa -> [Livro]
livros2 x y = [pessoa | (pessoa, livro) <- x, y == livro]

emprestimos2 :: BD -> Livro -> [Pessoa]
emprestimos2 x y = [pessoa | (pessoa, livro) <- x, y == livro]

emprestado2 :: BD -> Livro -> Bool
emprestado2 x y = [livro | (pessoa, livro) <- x, y == livro]

qtdEmprestimos2 :: BD -> Pessoa -> Int
qtdEmprestimos2 x y = (length [pessoa | (pessoa, livro) <- x, y == pessoa])

emprestar2 :: BD -> Pessoa -> Livro -> BD
emprestar2 b p l = b ++ [p,l]

devolver2 :: BD -> Pessoa -> Livro -> BD
devolver2 x y = [(pessoa, livro) | (pessoa, livro) <- x, y /= livro]

quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (h:t) = quicksort (filter (< h) t) ++ [h] ++ quicksort (filter (>= h) t)

getSpace :: String -> Int
getSpace [] = 0
getSpace (h:t)
	| h == ' ' = 0
	| otherwise = 1 + getSpace t

getWord :: String -> String
getWord [] = []
getWord s = take (getSpace s) s

dropWord :: String -> String
dropWord [] = []
dropWord s = drop (getSpace s) s

dropSpace :: String -> String
dropSpace [] = []
dropSpace (h:t) 
	| x !! 0 /= ' ' = x
	| otherwise = dropSpace t

splitWords :: String -> [Word]
splitWords [] = []
splitWords s
	| (getSpace s == 0 && s!!0 /= ' ') = (getWord s):[]
	| otherwise = (getWord s) : (splitWords $ dropSpace $ dropWord s)

main :: IO()
main = do
	putStrLn "Say my name!"
	putStrLn $ show $ quicksort [4, 2, 77, 1, 0, 123]
