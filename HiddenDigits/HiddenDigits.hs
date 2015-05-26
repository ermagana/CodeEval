import System.Environment (getArgs)
import Data.Char

revealDigits :: [Char] -> [Char]
revealDigits [x]
  | isNumber x == True = [x]
  | isLowerCaseRangeAtoJ x == True = [mapLetter x]
  | otherwise = []
revealDigits (x:xs)
  | isNumber x == True = x : revealDigits xs
  | isLowerCaseRangeAtoJ x == True = mapLetter x : revealDigits xs
  | otherwise = revealDigits xs

isLowerCaseRangeAtoJ :: Char -> Bool
isLowerCaseRangeAtoJ chr = isInRange chr ['a'..'j']

isInRange :: Char -> [Char] -> Bool
isInRange _ [] = False
isInRange x [y] = x == y
isInRange x (y:ys)
  | x == y = True
  | otherwise = isInRange x ys

mapLetter :: Char -> Char
mapLetter chr = indexAt chr '0' ['a'..'j']

indexAt :: Char -> Char -> [Char] -> Char
indexAt chr cur (x:xs)
  | chr == x = cur
  | otherwise = indexAt chr (succ cur) xs

buildOutPut :: [Char] -> [Char]
buildOutPut [] = "NONE"
buildOutPut x = x

main = do
  [inpFile] <- getArgs
  input <- readFile inpFile
  -- input <- readFile "input"
  mapM_ putStrLn $ [buildOutPut $ revealDigits x | x <- lines input]