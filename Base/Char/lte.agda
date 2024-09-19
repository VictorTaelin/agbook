module Base.Char.lte where

open import Base.Char.Type
open import Base.Char.Ord
open import Base.Bool.Type
open import Base.Ord.Trait

-- Less-than-or-equal-to comparison for characters.
-- Uses the Ord instance for Char.
lte : Char → Char → Bool
lte = _<=_ {{OrdChar}}
