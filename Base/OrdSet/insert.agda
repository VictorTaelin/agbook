module Base.OrdSet.insert where

import Base.TreeAVL.insert as AVL
open import Base.OrdSet.Type
open import Base.Pair.Type
open import Base.Trait.Ord
open import Base.Unit.Type

-- Inserts an element into an OrdSet.
-- This function is a wrapper around the AVL tree insert operation.
-- - V: The type of elements in the OrdSet.
-- - Ord V: An instance of the Ord typeclass for the element type.
-- - value: The element to be inserted into the OrdSet.
-- - set: The OrdSet to insert into.
-- = A new OrdSet with the specified element inserted.
insert : ∀ {V : Set} → {{_ : Ord V}} →
         V → OrdSet V → OrdSet V
insert value set = AVL.insert (value , unit) set

-- Infix notation for inserting an element into an OrdSet.
-- - x: The element to insert.
-- - s: The OrdSet to insert into.
-- = A new OrdSet with the element inserted.
_::>_ : ∀ {V : Set} → {{_ : Ord V}} → V → OrdSet V → OrdSet V
_::>_ = insert

infixr 5 _::>_
