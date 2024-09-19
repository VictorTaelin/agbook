module Data.Buffer.Type where

open import Data.U64.Type
open import Data.OrdMap.Type

-- A buffer of data of a fixed length.
-- If this is constructed manually, then (of course) you cannot
-- guarantee that `length` wll be the number entries in `data`.
record Buffer : Set where
  constructor MkGrid
  field
    length : U64
    data   : OrdMap U64 U64
