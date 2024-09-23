module Base.Buffer.Type where

open import Base.Nat.Type
open import Base.U64.Type
open import Base.OrdMap.Type

-- A buffer of data of a fixed length.
-- If this is constructed manually, then (of course) you cannot
-- guarantee that `length` will be the number entries in `buffer`.
record Buffer : Set where
  constructor MkBuffer
  field
    length : Nat
    buffer : OrdMap U64 U64
