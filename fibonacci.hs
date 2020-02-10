import Data.Function
import Control.Arrow

fibonacci :: (Eq a, Num a) => a -> a
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = (fibonacci $ n - 1) + (fibonacci $ n - 2)

fibStr :: String -> String
fibStr str = str ++ " => " ++ res where
  res = str & (read :: String -> Int) & fibonacci & show

main :: IO ()
main = interact $ lines
  >>> filter (not . null)
  >>> (map fibStr)
  >>> unlines
