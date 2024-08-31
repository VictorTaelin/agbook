module Data.Map.Type where

open import Data.Tree.Type
open import Data.Maybe.Type

-- Represents a Map as a Tree of Maybe values.
-- - A: The type of values stored in the map.
Map : Set → Set
Map A = Tree (Maybe A)

-- Export the tree constructors
open Tree public
