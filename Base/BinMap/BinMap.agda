module Base.BinMap.BinMap where

open import Base.BinTree.BinTree
open import Base.Maybe.Maybe

-- Represents a BinMap as a BinTree of Maybe values.
-- - A: The type of values stored in the map.
BinMap : Set → Set
BinMap A = BinTree (Maybe A)

-- Export the tree constructors
open BinTree public

