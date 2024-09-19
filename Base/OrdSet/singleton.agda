module Base.OrdSet.singleton where

open import Base.OrdSet.Type
import Base.AVL.singleton as AVL
open import Base.Unit.Type
open import Base.Pair.Type
open import Base.Ord.Trait

-- Creates an OrdSet containing a single element.
-- - V: The type of the element.
-- - Ord V: An instance of the Ord typeclass for the element type.
-- - value: The element to be added to the set.
-- = A new OrdSet containing only the given element.
singleton : ∀ {V : Set} → {{_ : Ord V}} → V → OrdSet V
singleton value = AVL.singleton (value , unit)
