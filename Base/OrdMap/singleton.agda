module Base.OrdMap.singleton where

open import Base.OrdMap.Type
import Base.AVL.singleton as AVL
open import Base.Pair.Type
open import Base.Ord.Trait

-- Creates an OrdMap containing a single key-value pair.
-- - K: The type of the key.
-- - V: The type of the value.
-- - Ord K: An instance of the Ord typeclass for the key type.
-- - key-value: The key-value pair for the single entry.
-- = A new OrdMap containing only the given key-value pair.
singleton : ∀ {K V : Set} → {{_ : Ord K}} → Pair K V → OrdMap K V
singleton = AVL.singleton
