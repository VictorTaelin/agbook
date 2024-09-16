module Data.U64.min where 

open import Data.U64.Type
open import Data.U64.lte
open import Data.U64.if
open import Data.U64.from-bool

-- Minimum of two U64 numbers.
-- - x: The first U64 number.
-- - y: The second U64 number.
-- = The smaller of x and y as a U64 number.
min : U64 → U64 → U64 
min x y = if (from-bool (x <= y)) then x else y