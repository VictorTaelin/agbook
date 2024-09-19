module Base.Char.gt where

open import Base.Char.Type
open import Base.Char.Ord
open import Base.Bool.Type
open import Base.Ord.Trait

-- Greater-than comparison for characters.
-- Uses the Ord instance for Char.
gt : Char → Char → Bool
gt = _>_ {{OrdChar}}
