module Base.BitMap.Type where

open import Base.TreeBin.Type
open import Base.Maybe.Type

-- Represents a BitMap as a TreeBin of Maybe values.
-- - A: The type of values stored in the map.
BitMap : Set → Set
BitMap A = TreeBin (Maybe A)

-- Export the tree constructors
open TreeBin public
