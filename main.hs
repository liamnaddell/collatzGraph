import Data.List
import Lib.Lib as Lib
import System.Environment

main = do
    args <- getArgs
    x args

firstGraph = do 
    putStrLn "Please input a number to collatz and graph by first"
    c <- getLine
    let intc = read c :: Int
    let collatzArray = Lib.collatz intc
    print collatzArray
    let dotArray = Lib.markByFirst(collatzArray)
    mapM putStrLn dotArray
    -- wont compile with out this b/c it returns an array of io actions
    putStr ""

sizeGraph = do
    putStrLn "Please input a number to collatz and graph by size"
    c <- getLine
    let intc = read c :: Int
    let collatzArray = Lib.collatz intc
    print collatzArray
    let dotArray = Lib.markByLargest(collatzArray)
    mapM putStrLn dotArray
    -- wont compile with out this b/c it returns an array of io actions
    putStr ""

printUsage = do
    let usage = "USAGE:\n   ./collatzArray [gbf|gbs]\n     gbf is graph by first(more informative)\n     gbs is graph by size"
    putStrLn usage

x args
    | length args == 0 = printUsage
    | args !! 0 == "gbf" = firstGraph
    | args !! 0 == "gbs" = sizeGraph
    | args !! 0 == "hlp" = printUsage
