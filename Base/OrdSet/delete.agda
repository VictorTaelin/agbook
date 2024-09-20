module Base.OrdSet.delete where

open import Base.OrdSet.Type
open import Base.Trait.Ord
import Base.AVL.delete as AVL

-- Deletes an element from an OrdSet.
-- This function is a wrapper around the AVL tree delete operation.
-- - V: The type of elements in the OrdSet.
-- - Ord V: An instance of the Ord typeclass for the element type.
-- - value: The element to be deleted from the OrdSet.
-- - set: The OrdSet to delete from.
-- = A new OrdSet with the specified element removed (if it existed).
delete : ∀ {V : Set} → {{_ : Ord V}} → V → OrdSet V → OrdSet V
delete = AVL.delete
