module Data.Int.gte where

open import Data.Int.Type
open import Data.Bool.Type
open import Data.Bool.or
open import Data.Int.gt
open import Data.Int.eq

gte : Int → Int → Bool
gte m n = (m > n) || (m == n)

_>=_ : Int → Int → Bool
_>=_ = gte
