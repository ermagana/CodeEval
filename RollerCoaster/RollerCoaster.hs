import System.Environment (getArgs)
import Data.Char

data Operation = UP | DOWN

rollerCoaster :: [Char] -> [Char]
rollerCoaster phrase = coast UP phrase

coast :: Operation -> [Char] -> [Char]
coast op [x] = [x]
coast UP (x:xs)
  | isLetter x == True = (toUpper x) : coast DOWN xs
  | otherwise = x : coast UP xs
coast DOWN (x:xs)
  | isLetter x == True = (toLower x) : coast UP xs
  | otherwise = x : coast DOWN xs


main = do
    [inpFile] <- getArgs
    input <- readFile inpFile
    -- input <- readFile "input"
    mapM_ putStrLn $ [ rollerCoaster x | x <- (lines input) ]