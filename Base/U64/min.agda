module Base.U64.min where 

open import Base.U64.U64
open import Base.U64.Trait.Ord
open import Base.U64.if
open import Base.U64.from-bool
open import Base.Trait.Ord

-- Minimum of two U64 numbers.
-- - x: The first U64 number.
-- - y: The second U64 number.
-- = The smaller of x and y as a U64 number.
min : U64 → U64 → U64 
min x y = if (from-bool (_<=_ {{OrdU64}} x y)) then x else y

