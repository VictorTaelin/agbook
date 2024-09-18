module Base.U64.gte where

open import Base.U64.Type
open import Base.U64.Ord
open import Base.Bool.Type
open import Base.Trait.Ord

-- Greater than or equal comparison for U64 numbers.
-- Uses the Ord instance for U64.
gte : U64 → U64 → Bool
gte = _>=_ {{OrdU64}}
