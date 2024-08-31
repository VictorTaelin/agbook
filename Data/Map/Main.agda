module Data.Map.Main where

open import Data.Tree.Main
open import Data.Maybe.Main

-- Represents a Map as a Tree of Maybe values.
-- - A: The type of values stored in the map.
Map : Set → Set
Map A = Tree (Maybe A)

-- Export the tree constructors
open Tree public