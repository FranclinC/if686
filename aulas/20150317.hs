{- implemente o algoritmo quicksort -}
quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = quicksort (filter (< x) xs) ++ [x] ++ quicksort (filter (>= x) xs)

{- Implemente uma função que, dado um número inteiro
N, retorne uma lista de inteiros com os N primeiros 
números pares da sequência de Fibonacci. -}
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

{- Crie um função que recebe uma lista de inteiros e
retorna a lista ordenada em função da soma de seus 
digitos(crescente): -}

{- Uma linha pode ser representada da seguinte forma:
type Ponto = (Float, Float) type Reta = (Ponto, Ponto)
• Defina funções que retornem 
• a primeira coordenada de um ponto
• a segunda coordenada de um ponto
– indique se uma reta é vertical ou não x1 == x2-}

main :: IO ()
main = do
    putStrLn "Welcome!"
    putStrLn (show [-1,1,100,43,12,0,424,53,99,98,97,-1000,12])
    putStrLn (show (quicksort [-1,1,100,43,12,0,424,53,99,98,97,-1000,12]))
    putStrLn "--"
    putStrLn (show (fib 3))