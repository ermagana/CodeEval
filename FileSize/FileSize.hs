import System.Environment (getArgs)

main = do
  -- [inpFile] <- getArgs
  -- input <- readFile inpFile
  input <- readFile "input"
  putStrLn $ show $ length input
