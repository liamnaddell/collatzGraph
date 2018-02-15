import Data.List

main = do
    putStrLn "Please input a number to collatz and graph"
    c <- getLine
    let oc = read c :: Int
    let collatzArray = collatz oc
    print collatzArray
    let finalArray = fine collatzArray
    mapM putStrLn finalArray


collatz :: Int -> [Int]
collatz 1 = [1]
collatz n
  | even n = n:collatz(n `div` 2)
  | odd n = n:collatz(3*n+1)


getLargest :: (Int,Int) -> [Int] -> Int -> (Int,Int)
getLargest (a,b) [] x = (a,b)
getLargest (a,b) n x
  | length(n) == x = (a,b)
  | a > (n !! x) = getLargest (a,b) n (x+1)
  | a < (n !! x) = getLargest ((n !! x), x) n (x+1)

-- turnArrayIntoDots :: [(Int,Int)] -> Int -> [String]
-- turnArrayIntoDots xs x  
--   | len == x = []
--   | otherwise = ('.':init(getSpaces(snd currentTuple))):(turnArrayIntoDots xs (x+1))
--     where currentTuple = (xs !! x)
--           len = length(xs)
--getSpaces :: Int -> String
--getSpaces 0 = []
--getSpaces x = ' ':getSpaces(x-1)

turnIntIntoDots :: Int -> String
turnIntIntoDots 0 = ['.']
turnIntIntoDots 1 = ['.']
turnIntIntoDots x = ' ':turnIntIntoDots(x-1)


removeIndex :: [Int] -> Int -> [Int]
removeIndex xs n = fst notGlued ++ snd notGlued
    where notGlued = (take (n-1) xs, drop n xs)

fine :: [Int] -> [String]
fine [1] = ["."]
fine [] = ["."]
fine xs = turnIntIntoDots(fst currentTuple):fine(newArray)
    where newArray = removeLargestElement xs
          currentTuple = getLargest (0,0) xs 0
-- append dots to array minus the largest element

removeLargestElement :: [Int] -> [Int]
removeLargestElement xs = removeIndex xs ((snd largest)+1)
    where largest = getLargest (0,0) xs 0
