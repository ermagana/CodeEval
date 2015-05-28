import System.Environment (getArgs)
import Data.List
import Text.Printf

sortNumberWords :: [Char] -> [Char]
sortNumberWords phrase = unwords [printf "%.3f" x | x <- sort $ [read x::Float | x <- words phrase]]

main = do
    [inpFile] <- getArgs
    input <- readFile inpFile
    -- input <- readFile "input"
    mapM_ putStrLn $ [sortNumberWords x | x <- (lines input) ] 