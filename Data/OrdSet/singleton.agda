module Data.OrdSet.singleton where

open import Data.OrdSet.Type
import Data.AVL.singleton as AVL
open import Data.Unit.Type
open import Data.Pair.Type
open import Data.Trait.Ord

-- Creates an OrdSet containing a single element.
-- - V: The type of the element.
-- - Ord V: An instance of the Ord typeclass for the element type.
-- - value: The element to be added to the set.
-- = A new OrdSet containing only the given element.
singleton : ∀ {V : Set} → {{_ : Ord V}} → V → OrdSet V
singleton value = AVL.singleton (value , unit)
