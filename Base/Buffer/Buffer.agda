module Base.Buffer.Buffer where

open import Base.Nat.Nat
open import Base.OrdMap.OrdMap
open import Base.U64.U64

-- A buffer of data of a fixed length.
-- If this is constructed manually, then (of course) you cannot
-- guarantee that `length` wll be the number entries in `buffer`.
record Buffer : Set where
  constructor MkBuffer
  field
    length : Nat
    buffer : OrdMap U64 U64
