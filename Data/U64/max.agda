module Data.U64.max where 

open import Data.U64.Type
open import Data.U64.lte
open import Data.U64.if

max : U64 → U64 → U64
max x y = if (x <= y) y x
