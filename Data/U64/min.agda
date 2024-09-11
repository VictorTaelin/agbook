module Data.U64.min where 

open import Data.U64.Type
open import Data.U64.lte
open import Data.U64.if

minU64 : U64 → U64 → U64
minU64 x y = ifU64 (lteU64 x y) x y
