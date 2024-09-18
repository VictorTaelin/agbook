module Base.Char.lt where

open import Base.Char.Type
open import Base.Char.Ord
open import Base.Bool.Type
open import Base.Trait.Ord

-- Less-than comparison for characters.
-- Uses the Ord instance for Char.
lt : Char → Char → Bool
lt = _<_ {{OrdChar}}
