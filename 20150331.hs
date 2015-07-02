-- TRABALHO 04

{- 1. Quando tratamos de polimorfismo em haskell, podemos garantir que ele é mais seguro quanto 
a garantia de que os tipos terão implementações das funcionalidades que serão utilizadas sob eles, 
pois é possível restringir que os argumentos genéricos possuam implementações de determinadas funções,
sendo esses definidos por uma classe. Em Java, o Generics que é utilizado no polimorfismo acaba 
sendo mais geral pois não restringe os dados, porém é mais sucetível à erro tendo em vista que apenas
ocorre uma verificação de tipo em tempo de execução.-}

-- 2.
lookAndSay :: Int -> Int
lookAndSay n = read (iterate las "1" !! n)

las s = display $ foldl calculate ("", 0, '0') s

calculate :: (String, Int, Char) -> Char -> (String, Int, Char)
calculate (xs, 0, '0') x = (xs, 1, x)
calculate (xs, n, y) x
	| (x == y) = (xs, n + 1, y)
	| otherwise = (display (xs, n, y), 1, x)

display (xs, n, y) = xs ++ (show n) ++ (y:"")

-- 3.

-- 4.
