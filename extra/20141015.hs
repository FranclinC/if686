-- Lista 1, 2014.2
module Main where

-- 8.
buscaPalavra :: String -> [String] -> [String]

main :: IO()
main = do
	putStrLn $ show $ buscaPalavra "pont" ["ponta", "apontar", "Ponteiro", "porto"]