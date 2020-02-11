#! /usr/bin/env runhaskell
import Data.Function
import Control.Arrow

fibonacci :: Integer -> Integer
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = (fibonacci $ n - 1) + (fibonacci $ n - 2)

fibStr :: String -> String
fibStr str = str ++ " => " ++ res where
  res = str & read & fibonacci & show

main :: IO ()
main = interact $ lines
  >>> filter (not . null)
  >>> (map fibStr)
  >>> unlines
