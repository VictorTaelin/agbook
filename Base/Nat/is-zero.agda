module Base.Nat.is-zero where

open import Base.Bool.Type
open import Base.Nat.Type

-- Checks if a natural number is zero.
-- - n: The natural number to check.
-- = True if n is zero, False otherwise.
is-zero : Nat → Bool
is-zero Zero     = True
is-zero (Succ _) = False
