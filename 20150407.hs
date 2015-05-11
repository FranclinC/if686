-- TRABALHO 05

{- Questionário enviado! -}

-- AULA 04

type Horas = Int
type Disciplinas = [String]

data Dias = Segunda Horas Disciplinas
	| Terca Horas Disciplinas
	| Quarta Horas Disciplinas
	| Quinta Horas Disciplinas
	| Sexta Horas Disciplinas
	| Sabado
	| Domingo

isFimDeSemana :: Dias -> Bool
isFimDeSemana Sabado = True
isFimDeSemana Domingo = True
isFimDeSemana _ = False

hasPLC :: Dias -> Bool
hasPLC (Segunda h d) = elem "PLC" d
hasPLC (Terca h d) = elem "PLC" d
hasPLC (Quarta h d) = elem "PLC" d
hasPLC (Quinta h d) = elem "PLC" d
hasPLC (Sexta h d) = elem "PLC" d
hasPLC Sabado = False
hasPLC Domingo = False

data List t = Nil | Cons t (List t)
data Tree t = NilT | Node t (Tree t) (Tree t) deriving (Eq, Ord)

--showExpr :: Expr -> String
--fromList :: [t] -> List t
--depth :: Tree t -> Int
--collapse :: Tree t -> [t]
--bfs :: Tree t -> t -> Bool
--mapTree :: (t -> u) -> Tree t -> Tree u