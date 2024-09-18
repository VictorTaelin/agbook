module Data.OrdSet.contains where

open import Data.OrdSet.Type
open import Data.Bool.Type
open import Data.Trait.Ord
import Data.AVL.has-key as AVL

-- Checks if an element is present in the OrdSet.
-- - elem: The element to search for.
-- - set: The OrdSet to search in.
-- = True if the element is found, False otherwise.
contains : ∀ {V : Set} → {{_ : Ord V}} → V → OrdSet V → Bool
contains = AVL.has-key
