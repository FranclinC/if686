module Main where

{- Exercícios do slide-}

menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior a b c = (min (min a b) c, max (max a b) c)

-- atualização: exercícios realizado no dia 24/03

ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (a, b, c) = (menor, (a + b + c) - maior - menor, maior)
	where 
		menor = (min (min a b) c)
		maior = (max (max a b) c)

type Ponto = (Float, Float)
type Reta = (Ponto, Ponto)

fstCo :: Ponto -> Float
fstCo  (x, _) = x

sndCo :: Ponto -> Float
sndCo (_, y) = y

retaV :: Reta -> Bool
retaV ((x1,y1), (x2,y2))
	| (x1 == x2) = True
	| otherwise = False

type Pessoa = String
type Livro = String
type BD = [(Pessoa, Livro)]

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

--funções usando compreensão de lista
livros2 :: BD -> Pessoa -> [Livro]
livros2 x y = [pessoa | (pessoa, livro) <- x, y == livro]

emprestimos2 :: BD -> Livro -> [Pessoa]
emprestimos2 x y = [pessoa | (pessoa, livro) <- x, y == livro]

emprestado2 :: BD -> Livro -> Bool
emprestado2 x y = [livro | (pessoa, livro) <- x, y == livro]

qtdEmprestimos2 :: BD -> Pessoa -> Int
qtdEmprestimos2 x y = (length [pessoa | (pessoa, livro) <- x, y == pessoa])

emprestar :: BD -> Pessoa -> Livro -> BD
emprestar b p l = b ++ [p,l]

devolver2 :: BD -> Pessoa -> Livro -> BD
devolver2 x y = [(pessoa, livro) | (pessoa, livro) <- x, y /= livro]

--processamento de texto
getWord :: String -> String
getWord x 
	| (x == []) = []
	| otherwise = take (getSpace x) x

dropWord :: String -> String
dropWord x 
	| (x == []) = []
	| otherwise = drop (getSpace x) x

dropSpace :: String -> String
dropSpace x 
	| (x == []) = []
	| (x!!0 /= ' ') = x
	| otherwise = dropSpace (tail x)

main :: IO()
main = do
	putStrLn "The main entry point."
	putStrLn (show (retaV ((2,1),(3,5))))
