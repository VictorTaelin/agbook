module Base.BitMap.BitMap where

open import Base.BinTree.BinTree
open import Base.Maybe.Maybe

-- Represents a BitMap as a BinTree of Maybe values.
-- - A: The type of values stored in the map.
BitMap : Set -> Set
BitMap A = BinTree (Maybe A)

-- Export the tree constructors
open BinTree public
