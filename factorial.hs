#! /usr/bin/env runhaskell
import Control.Arrow

factorial :: (Eq p, Num p) => p -> p
factorial 0 = 1
factorial n = n * factorial (n - 1)

facStr :: String -> String
facStr str = str ++ " => " ++ s where
  n = read str :: Int
  y = factorial n
  s = show y

main :: IO ()
main = interact $ lines
  >>> (filter $ not . null)
  >>> (map facStr)
  >>> unlines
