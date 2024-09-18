module Base.Map.Type where

open import Base.Tree.Type
open import Base.Maybe.Type

-- Represents a Map as a Tree of Maybe values.
-- - A: The type of values stored in the map.
Map : Set → Set
Map A = Tree (Maybe A)

-- Export the tree constructors
open Tree public
