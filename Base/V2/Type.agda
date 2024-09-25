module Base.V2.Type where

open import Base.F64.Type

-- Represents a 2D vector with float coordinates.
-- - 1st: The x-coordinate (F64).
-- - 2nd: The y-coordinate (F64).
-- = A record type V2 containing x and y fields.
record V2 : Set where
  constructor MkV2
  field
    x : F64
    y : F64
