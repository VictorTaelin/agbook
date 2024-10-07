module Base.Nat.show where

open import Base.Nat.Nat
open import Base.String.String

primitive primShowNat : Nat → String

-- Converts a natural number to its string representation.
-- - 1st: The natural number to convert.
-- = A string representation of the given natural number.
show : Nat → String
show = primShowNat