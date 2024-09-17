module Data.Int.max where

open import Data.Int.Type
open import Data.Int.gte
open import Data.Bool.if

max : Int → Int → Int
max m n = if m >= n then m else n
