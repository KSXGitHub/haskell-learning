#! /usr/bin/env runhaskell
import Control.Arrow

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

facStr :: String -> String
facStr str = str ++ " => " ++ s where
  n = read str
  y = factorial n
  s = show y

main :: IO ()
main = interact $ lines
  >>> (filter $ not . null)
  >>> (map facStr)
  >>> unlines
