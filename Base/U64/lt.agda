module Base.U64.lt where

open import Base.U64.Type
open import Base.U64.Ord
open import Base.Bool.Type
open import Base.Ord.Trait

-- Less than comparison for U64 numbers.
-- Uses the Ord instance for U64.
lt : U64 → U64 → Bool
lt = _<_ {{OrdU64}}
