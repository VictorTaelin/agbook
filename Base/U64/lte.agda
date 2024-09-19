module Base.U64.lte where

open import Base.U64.Type
open import Base.U64.Ord
open import Base.Bool.Type
open import Base.Ord.Trait

-- Less than or equal comparison for U64 numbers.
-- Uses the Ord instance for U64.
lte : U64 → U64 → Bool
lte = _<=_ {{OrdU64}}
