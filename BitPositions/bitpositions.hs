import System.Environment (getArgs)
import Numeric
import Data.Char
import Data.List.Split

bitCheck :: [[Char]] -> [Char]
bitCheck (n:p1:p2:_)
    | bin!!idx1 == bin!!idx2 = "true"
    | otherwise = "false"
    where bin = reverse $ showIntAtBase 2 intToDigit (read n::Int) ""
          idx1 = (read p1::Int) - 1
          idx2 = (read p2::Int) - 1


main = do
    [inpFile] <- getArgs
    input <- readFile inpFile
    -- print your output to stdout
    mapM_ putStrLn $ [ bitCheck $ splitOn "," x | x <- (lines input) ]