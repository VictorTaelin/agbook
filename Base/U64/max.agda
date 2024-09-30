module Base.U64.max where 

open import Base.U64.U64
open import Base.U64.Trait.Ord
open import Base.U64.if
open import Base.U64.from-bool
open import Base.Trait.Ord

-- Maximum of two U64 numbers.
-- - x: The first U64 number.
-- - y: The second U64 number.
-- = The larger of x and y as a U64 number.
max : U64 → U64 → U64
max x y = if (from-bool (_>=_ {{OrdU64}} x y)) then x else y
