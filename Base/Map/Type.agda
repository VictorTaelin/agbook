module Base.Map.Type where

open import Base.TreeBin.Type
open import Base.Maybe.Type

-- Represents a Map as a TreeBin of Maybe values.
-- - A: The type of values stored in the map.
Map : Set → Set
Map A = TreeBin (Maybe A)

-- Export the tree constructors
open TreeBin public
