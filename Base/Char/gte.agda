module Base.Char.gte where

open import Base.Char.Type
open import Base.Char.Ord
open import Base.Bool.Type
open import Base.Ord.Trait

-- Greater-than-or-equal-to comparison for characters.
-- Uses the Ord instance for Char.
gte : Char → Char → Bool
gte = _>=_ {{OrdChar}}
