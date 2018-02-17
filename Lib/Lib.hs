module Lib.Lib 
    ( collatz
    , markByLargest
    , markByFirst
    ) where
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

turnIntIntoDots :: Int -> String
turnIntIntoDots 0 = ['.']
turnIntIntoDots 1 = ['.']
turnIntIntoDots x = ' ':turnIntIntoDots(x-1)

removeIndex :: [Int] -> Int -> [Int]
removeIndex xs n = fst notGlued ++ snd notGlued
    where notGlued = (take (n-1) xs, drop n xs)

markByLargest :: [Int] -> [String]
markByLargest [1] = ["."]
markByLargest [] = ["."]
markByLargest xs = turnIntIntoDots(fst currentTuple):markByLargest(newArray)
    where newArray = removeLargestElement xs
          currentTuple = getLargest (0,0) xs 0

markByFirst :: [Int] -> [String]
markByFirst [] = []
markByFirst xs = dots:markByFirst(newList)
      where len = (length xs)-1
            newList = tail xs
            dots = turnIntIntoDots(head xs)

removeLargestElement :: [Int] -> [Int]
removeLargestElement xs = removeIndex xs ((snd largest)+1)
    where largest = getLargest (0,0) xs 0


