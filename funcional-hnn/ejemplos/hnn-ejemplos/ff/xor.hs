module Main where

import AI.HNN.FF.Network
import Numeric.LinearAlgebra

samples :: Samples Double
samples = [ (fromList [0, 0], fromList [0])
          , (fromList [0, 1], fromList [1])
          , (fromList [1, 0], fromList [1])
          , (fromList [1, 1], fromList [0])
          ]

main :: IO ()
main = do
    let fileName = "input.csv"
    input <- readFile fileName
    let csv = parseCSV fileName input
    either handleError doWork csv

    handleError csv = putStrLn "not a CSV"
    -- doWork csv = (print.findOldest.tail) (filter (\x -> length x == 3) csv)
    doWork csv = (print.myApply.tail) (filter (\x -> length x == 3) csv)


--
myApply :: [Record] -> [Sample Double]
myApply [] = []
myApply items = foldr (\each recursive -> (fromList [getX each, getY each], fromList [getR each]):recursive ) [] items

getX [a,b,c] = toInt a
getY [a,b,c] = toInt b
getR [a,b,c] = toInt c

toInt :: String -> Double
toInt = read


    -- n <- createNetwork 2 [2] 1
    -- mapM_ (print . output n tanh . fst) samples
    -- putStrLn "------------------"
    --el 0.8 es el learning rate
    -- let n' = trainNTimes 1000 0.8 tanh tanh' n samples
    -- mapM_ (print . output n' tanh . fst) samples
    --saveNetwork "smartNet.nn" n'
