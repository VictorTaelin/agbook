module Data.U64.max where 

open import Data.U64.Type
open import Data.U64.gte
open import Data.U64.if
open import Data.U64.from-bool

-- Maximum of two U64 numbers.
-- - x: The first U64 number.
-- - y: The second U64 number.
-- = The larger of x and y as a U64 number.
max : U64 → U64 → U64
max x y = if (from-bool (x >= y)) then x else y