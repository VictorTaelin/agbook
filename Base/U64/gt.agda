module Base.U64.gt where

open import Base.U64.Type
open import Base.U64.Ord
open import Base.Bool.Type
open import Base.Trait.Ord

-- Greater than comparison for U64 numbers.
-- Uses the Ord instance for U64.
gt : U64 → U64 → Bool
gt = _>_ {{OrdU64}}
