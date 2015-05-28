import Text.Printf
import Data.Char
stripStart'EM :: [Char] -> [Char]
stripStart'EM s = dropWhile isSpace s

multiplicationMatrix :: Int -> [[String]]
multiplicationMatrix 0 = [["0"]]
multiplicationMatrix x = [[printf "%4s" $ show $ a * b | a <- [1..(abs x)]] | b <- [1..(abs x)]]

sprintMatrix :: [[String]] -> [String]
sprintMatrix mx = [stripStart'EM $ Prelude.foldl1 (++) x | x <- mx]

main = mapM_ putStrLn $ sprintMatrix $ multiplicationMatrix 12