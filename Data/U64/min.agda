module Data.U64.min where 

open import Data.U64.Type
open import Data.U64.lte
open import Data.U64.if
open import Data.U64.from-bool

min : U64 → U64 → U64 
min x y = if (from-bool (x <= y)) then x else y
