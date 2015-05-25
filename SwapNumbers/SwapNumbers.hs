import System.Environment (getArgs)

swapNumbers :: [Char] -> [Char]
swapNumbers phrase = unwords $ [ swapPrefixSuffix x | x <- words phrase]

swapPrefixSuffix :: [Char] -> [Char]
swapPrefixSuffix word = suffix : body ++ [prefix]
  where prefix = head word
        suffix = head $ reverse word
        tailTake = (length $ tail word) - 1
        body = take tailTake (tail word)


main = do
  [inpFile] <- getArgs
  input <- readFile inpFile
  -- input <- readFile "input"
  mapM_ putStrLn $ [ swapNumbers x | x <- (lines input)]