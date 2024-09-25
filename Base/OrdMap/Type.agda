module Base.OrdMap.Type where

open import Base.Pair.Type
open import Base.AVLTree.Type

-- OrdMap is a type alias for AVL trees.
-- It represents an ordered map (dictionary) data structure.
-- - K: The type of keys in the map.
-- - V: The type of values associated with the keys.
-- The underlying implementation uses an AVL tree for efficient
-- insertion, deletion, and lookup operations.
OrdMap : (K V : Set) -> Set
OrdMap K V = AVLTree K V
