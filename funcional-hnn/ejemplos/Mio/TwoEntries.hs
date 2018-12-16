module Main where

--import Text.CSV
import Control.Monad
import Data.List.Split
import Data.Char
import Numeric.LinearAlgebra
import AI.HNN.FF.Network
import Parser

-- Parses a CSV file
main :: IO ()
main = do
  let fileName = "./inputs/suma.csv"
  input <- readFile fileName

  putStrLn "From file:"
  print input
  putStrLn "-------------"

  let samples' = newParser2 (transformAll (parseInput input))

  putStrLn "Data parsed from file:"
  print samples'
  putStrLn "-------------"

  n <- createNetwork 2 [3] 1

  let n' = trainNTimes 15 0.5 tanh tanh' n samples'
  --mapM_ (print . output n' tanh . fst) samples'

  putStrLn "Printing Matrix:"
  putStrLn $ show n'
  saveNetwork "outputs/twoEntries/TwoEntriesNetwork.nn" n'
  putStrLn "-------------"

  putStrLn ""
  putStrLn "Printing example:"
  print . output n' tanh $ testInput where testInput = fromList [ 4.0, 4.0 ]
