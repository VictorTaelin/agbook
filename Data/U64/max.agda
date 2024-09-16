module Data.U64.max where 

open import Data.U64.Type
open import Data.U64.gte
open import Data.U64.if
open import Data.U64.from-bool

max : U64 → U64 → U64
max x y = if (from-bool (x >= y)) then x else y 
