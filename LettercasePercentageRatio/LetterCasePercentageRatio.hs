import System.Environment (getArgs)
import Text.Printf
import Data.Char

calculateLetterCaseRatio :: [Char] -> [Float]
calculateLetterCaseRatio [] = [ 0, 0 ]
calculateLetterCaseRatio phrase = [ lowerRatio, upperRatio ]
  where phraseLength = length phrase
        lowerRatio = calc phraseLength [x | x <- phrase, isLower x ]
        upperRatio = calc phraseLength [x | x <- phrase, isUpper x ]

calc :: Int -> [Char] -> Float
calc _ [] = 0
calc 0 _ = 0
calc phraseLength chars = chr/len
  where len = fromIntegral phraseLength::Float
        chr = fromIntegral (length chars)::Float

main = do
    [inpFile] <- getArgs
    input <- readFile inpFile
    -- input <- readFile "input"
    mapM_ (\(x:y:_) -> printf "lowercase: %.2f uppercase: %.2f\n" (x * 100) (y * 100)) $ [ calculateLetterCaseRatio x | x <- (lines input) ]