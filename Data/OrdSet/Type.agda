module Data.OrdSet.Type where

open import Data.AVL.Type
open import Data.Unit.Type

-- OrdSet is a type alias for AVL trees with Unit as the value type.
-- It represents an ordered set data structure.
-- - V: The type of elements in the set.
-- The underlying implementation uses an AVL tree for efficient
-- insertion, deletion, and lookup operations.
OrdSet : (V : Set) → Set
OrdSet V = AVL V Unit
