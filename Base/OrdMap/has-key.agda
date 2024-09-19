module Base.OrdMap.has-key where

open import Base.OrdMap.Type
open import Base.AVL.Type
import Base.AVL.has-key as AVL
open import Base.Pair.Type
open import Base.Bool.Type
open import Base.Ord.Trait
open import Base.Pair.ord.fst

-- Checks if a key exists in the OrdMap.
-- - key: The key to search for.
-- - map: The OrdMap to search in.
-- = True if the key is found, False otherwise.
has-key : ∀ {K V : Set} → {{_ : Ord K}} → K → OrdMap K V → Bool
has-key = AVL.has-key
