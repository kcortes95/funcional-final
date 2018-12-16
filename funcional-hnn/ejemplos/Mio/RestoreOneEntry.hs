module Main where

import Control.Monad
import Data.List.Split
import Data.Char
import Numeric.LinearAlgebra
import AI.HNN.FF.Network



-- Parses a CSV file
main :: IO ()
main = do
    n <- createNetwork 1 [3] 1

    let n' = loadNetwork "outputs/oneEntry/OneEntryNewtork.nn" n
    --let n' = trainNTimes 15 0.5 tanh tanh' n samples'
    --mapM_ (print . output n' tanh . fst) samples'

    putStrLn "Printing Matrix:"
    putStrLn $ show n
    --saveNetwork "outputs/oneEntry/OneEntryNewtork.nn" n'
    putStrLn "-------------"

    --putStrLn ""
    --putStrLn "Printing example:"
    --print . output n' tanh $ testInput where testInput = fromList [ 5.0 ]
