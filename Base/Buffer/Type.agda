module Base.Buffer.Type where

open import Base.U64.Type
open import Base.OrdMap.Type

-- A buffer of data of a fixed length.
-- If this is constructed manually, then (of course) you cannot
-- guarantee that `length` wll be the number entries in `data`.
record Buffer : Set where
  constructor MkBuffer
  field
    length : U64
    buffer : OrdMap U64 U64
