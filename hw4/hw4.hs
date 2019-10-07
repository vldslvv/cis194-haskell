module Hw4 where

fun1 :: [Integer] -> Integer
fun1 [] = 1
fun1 (x:xs)
    | even x    = (x - 2) * fun1 xs
    | otherwise = fun1 xs

fun2 :: Integer -> Integer
fun2 1 = 0
fun2 n
    | even n    = n + fun2 (n `div` 2)
    | otherwise = fun2 (3*n + 1)

fun1' :: [Integer] -> Integer
fun1' xs = product $ map (\x -> x - 2) $ filter even xs

fun2' :: Integer -> Integer
-- map every number to even
fun2' n = sum . filter even . takeWhile (> 1) $ iterate (\x -> if even x then (div x 2) else (3*x + 1)) n


main :: IO()
main = do
    putStrLn . show $ zip [1..10] $ map fun2 [1..10]
    putStrLn . show $ zip [1..10] $ map fun2' [1..10]