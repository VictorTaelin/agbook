module Data.Int.min where

open import Data.Int.Type
open import Data.Int.lte
open import Data.Bool.if

min : Int -> Int -> Int
min m n = if m <= n then m else n
