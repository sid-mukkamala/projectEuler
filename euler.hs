import Control.Monad (guard)

-- Warmup problems 

-- Problem 1, unnecessarily using do-noation while a list comprehension would "do" 
-- https://projecteuler.net/problem=1
-- Sub-optimal solution, runs in O(n)

problem001 :: Int  -> Int 
problem001 a = let lstgen = do 
                              val <- [1..a]
                              guard $ (mod val 3 == 0) || (mod val 5 == 0) 
                              return val
                in sum lstgen

-- Better solution, runs in O(1)
-- Uses number theory
-- the sum of series (1 + 2 + 3 + ..n) = n(n + 1)/2 
sumseries :: Int -> Int
sumseries n = n * (n + 1) `div` 2 


-- factor multiples of 3 as : 3(1 + 2 + 3 ...)
-- factor multiples of 5 as : 5(1 + 2 + 3 ...)
-- apply above summation 
-- Note : we end up double counting multiples of both 3 and 5
-- factor multiples of 15 and minus them from total

problem001' :: Int -> Int 
problem001' n = 
    let mult3s =  3 *  (sumseries $ n `div` 3)
        mult5s =  5 *  (sumseries $ n `div` 5)
        mult15s = 15 *  (sumseries $ n `div` 15) 
    in mult3s + mult5s - mult15s



-- Problem 432