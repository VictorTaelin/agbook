module Data.OrdMap.has-key where

open import Data.OrdMap.Type
open import Data.AVL.Type
import Data.AVL.has-key as AVL
open import Data.Pair.Type
open import Data.Bool.Type
open import Data.Trait.Ord
open import Data.Pair.ord.fst

-- Checks if a key exists in the OrdMap.
-- - key: The key to search for.
-- - map: The OrdMap to search in.
-- = True if the key is found, False otherwise.
has-key : ∀ {K V : Set} → {{_ : Ord K}} → K → OrdMap K V → Bool
has-key = AVL.has-key
