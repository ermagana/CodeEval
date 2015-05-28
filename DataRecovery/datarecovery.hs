import System.Environment (getArgs)
import Data.Ord
import Data.List
import Data.List.Split

recover :: [Char] -> String
recover codedPhrase = newphrase
  where dataAndInstructions = splitOn ";" codedPhrase
        phrase = buildPhrase dataAndInstructions
        instructions = buildInstructions dataAndInstructions
        fixedInstruction = instructions ++ [(identifyMissingIndex (length $ phrase) instructions)]
        newphrase = unwords [snd x | x <- (sortBy (comparing fst) (zip fixedInstruction phrase))]

identifyMissingIndex :: Int -> [Int] -> Int
identifyMissingIndex phraseLength indexes = missingIndex
  where rangeSearch = [1..phraseLength]
        missingIndex = head [x | x <- rangeSearch, (elemIndex x indexes) == Nothing]

buildPhrase :: [[Char]] -> [String]
buildPhrase phraseAndData = words $ head phraseAndData

buildInstructions :: [[Char]] -> [Int]
buildInstructions phraseAndData = [read x::Int | x <- (words $ head $ tail phraseAndData)]

main = do
    [inpFile] <- getArgs
    input <- readFile inpFile
    -- input <- readFile "input"
    mapM_ putStrLn $ [ recover x | x <- (lines input) ]