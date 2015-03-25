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
type BD = [(Pessoa,Livro)]

baseExemplo :: BD
baseExemplo =
	[("sergio","O senhor dos aneis"),
	("Andre", "Duna"),
	("Fernando", "Jonhatan e something"),
	("Fernando", "Game of Thro")]

livros :: BD -> Pessoa -> [Livro]
livros bd s
	| (s == fst bd) = [snd bd] ++ (livros bd s)
	| otherwise = (livros bd s)

{-emprestimos :: BD -> Livro -> [Pessoa]

emprestado :: BD -> Livro -> Bool

qtd :: BD -> Pessoa -> Int

emprestar :: BD -> Pessoa -> Livro -> BD

devolver :: BD -> Pessoa -> Livro -> BD-}

main :: IO()
main = do
	putStrLn "The main entry point."
	putStrLn (show (retaV ((2,1),(3,5))))
