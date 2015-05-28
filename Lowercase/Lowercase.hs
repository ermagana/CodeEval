import System.Environment (getArgs)
import Data.Char

main = do
    [inpFile] <- getArgs
    input <- readFile inpFile
    -- print your output to stdout
    mapM_ putStrLn $ [ map toLower x | x <- (lines input) ]