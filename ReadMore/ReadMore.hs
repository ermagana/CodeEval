import System.Environment (getArgs)

readMore :: [Char] -> [Char]
readMore phrase
  | length phrase <= 55 = phrase
  | otherwise = smartTake 39 phrase ++ "... <Read More>"

smartTake :: Int -> [Char] -> [Char]
smartTake maxLength phrase
  | phrases == 1 = take 40 phrase
  | length newPhrase <= maxLength = newPhrase
  | otherwise = smartTake maxLength newPhrase
  where newPhrase = unwords $ init $ words phrase
        phrases = length (words phrase)

main = do
  [inpFile] <- getArgs
  input <- readFile inpFile
  -- input <- readFile "input"
  mapM_ putStrLn $ [ readMore x | x <- lines input ]