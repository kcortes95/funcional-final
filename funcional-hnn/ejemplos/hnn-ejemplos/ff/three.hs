import AI.HNN.FF.Network
import Numeric.LinearAlgebra

samples :: Samples Double
samples = [
  (fromList [ 1, 1, 1, 1, 1
            , 0, 0, 0, 0, 1
            , 0, 0, 1, 1, 1
            , 0, 0, 0, 0, 1
            , 1, 1, 1, 1, 1 ], fromList [1]),   -- three

  (fromList [ 1, 1, 1, 1, 1
            , 0, 0, 0, 0, 1
            , 1, 1, 1, 1, 1
            , 0, 0, 0, 0, 1
            , 1, 1, 1, 1, 1 ], fromList [1]),   -- three

  (fromList [ 0, 1, 1, 1, 1
            , 0, 0, 0, 0, 1
            , 0, 0, 0, 1, 1
            , 0, 0, 0, 0, 1
            , 0, 1, 1, 1, 1 ], fromList [1]),   -- three

  (fromList [ 1, 1, 1, 1, 1
            , 1, 0, 0, 0, 1
            , 1, 0, 0, 0, 1
            , 1, 0, 0, 0, 1
            , 1, 1, 1, 1, 1 ], fromList [0]),   -- not a three

  (fromList [ 1, 1, 1, 1, 1
            , 1, 0, 0, 0, 0
            , 1, 0, 0, 0, 0
            , 1, 0, 0, 0, 0
            , 1, 0, 0, 0, 0 ], fromList [0]),   -- not a three

  (fromList [ 0, 1, 1, 1, 0
            , 0, 1, 0, 1, 0
            , 0, 1, 1, 1, 0
            , 0, 1, 0, 1, 0
            , 0, 1, 1, 1, 0 ], fromList [0]),   -- not a three

  (fromList [ 0, 0, 1, 0, 0
            , 0, 1, 1, 0, 0
            , 1, 0, 1, 0, 0
            , 0, 0, 1, 0, 0
            , 0, 0, 1, 0, 0 ], fromList [0]) ]  -- not a three

main :: IO ()
main = do
  n <- createNetwork 25 [250] 1
  let n' = trainNTimes 10000 0.5 tanh tanh' n samples
  mapM_ (print . output n' tanh . fst) samples
  putStrLn "-------------"
  print . output n' tanh $ testInput

  where testInput = fromList [ 0, 0, 1, 1, 1
                             , 0, 0, 0, 0, 1
                             , 0, 0, 1, 1, 1
                             , 0, 0, 0, 0, 1
                             , 0, 0, 1, 1, 1 ]

{-

OUTPUT:
fromList [0.9996325368507625]
fromList [0.9997784075859734]
fromList [0.9996165887689248]
fromList [-2.8107935971909852e-2]
fromList [7.001808876464477e-3]
fromList [2.54989546107178e-2]
fromList [5.286805464313172e-4]
-------------
fromList [0.9993713524712442]
-}
