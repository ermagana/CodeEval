import System.Environment (getArgs)
import Text.Printf
import Data.Char

main = do
    [inpFile] <- getArgs
    input <- readFile inpFile
    -- input <- readFile "input"
    print $ foldl (+) 0 [read x::Int | x <- (lines input)]
