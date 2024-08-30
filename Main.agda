module Main where

open import IO.Main
open import String.Main
open import Unit.Main
open import String.concat

data N : Set where
  s : N -> N
  z : N

add : N → N → N
add z     m = m
add (s n) m = add n (s m)

mod3 : N → N
mod3 z             = z
mod3 (s z)         = s z
mod3 (s (s z))     = s (s z)
mod3 (s (s (s n))) = mod3 n

fib3 : N → N
fib3 z         = z
fib3 (s z)     = s z
fib3 (s (s n)) = mod3 (add (fib3 n) (fib3 (s n)))

show : N → String
show z     = "z"
show (s n) = "(s " ++ show n ++ ")"

main : IO Unit
main = putStrLn ("result = " ++ show (fib3
  (s (s (s (s
  (s (s (s (s (s (s (s (s
  (s (s (s (s (s (s (s (s
  (s (s (s (s (s (s (s (s
  (s (s (s (s (s (s (s (s z))))))))))))))))))))))))))))))))))))))
