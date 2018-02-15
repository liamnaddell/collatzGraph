import Data.List
import Lib.Lib as Lib

main = do
    putStrLn "Please input a number to collatz and graph"
    c <- getLine
    let oc = read c :: Int
    let collatzArray = Lib.collatz oc
    print collatzArray
    let finalArray = Lib.aintToAstring collatzArray
    mapM putStrLn finalArray
