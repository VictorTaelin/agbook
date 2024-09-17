module Data.Int.lte where

open import Data.Int.Type
open import Data.Bool.Type
open import Data.Bool.or
open import Data.Int.lt
open import Data.Int.eq

lte : Int → Int → Bool
lte m n = (m < n) || (m == n)

_<=_ : Int → Int → Bool
_<=_ = lte
