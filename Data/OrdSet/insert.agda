module Data.OrdSet.insert where

open import Data.OrdSet.Type
open import Data.Unit.Type
open import Data.Pair.Type
open import Data.Trait.Ord
import Data.AVL.insert as AVL

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
