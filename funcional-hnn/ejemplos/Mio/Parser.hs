module Parser (
    parseInput,
    transformAll,
    transform,
    newParser,
    newParser2,
    myStringToInt,
    myStringToDouble
) where

import Control.Monad
import Data.List.Split
import Data.Char
import Numeric.LinearAlgebra

-- iterate over input
-- parseInputEnter :: String -> [[String]]
parseInput a = foldr (\x rec->  (foldr (\y rec2 -> y:rec2) [] (splitOn "," x)):rec) [] (splitOn "\n" a)

transformAll :: [[String]] -> [[Double]]
transformAll [] = []
transformAll (rs:rss) = if (rs /= [""]) then (transform rs):transformAll(rss) else transformAll(rss)

transform :: [String] -> [Double]
transform [] = []
transform (r:rs) = (myStringToDouble r):transform(rs)

newParser :: [[Double]] -> [(Vector Double, Vector Double)]
newParser [] = []
newParser (as:ass) = (fromList [as!!0], fromList [as!!1]):newParser(ass)

newParser2 :: [[Double]] -> [(Vector Double, Vector Double)]
newParser2 [] = []
newParser2 (as:ass) = (fromList [as!!0, as!!1], fromList [as!!2]):newParser2(ass)

myStringToInt s = read s::Int
myStringToDouble s = read s::Double
