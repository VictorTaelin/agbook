module Data.List.Omega.Type where

open import Data.List.Type

-- Represents a potentially infinite list of elements.
-- - A: The type of elements in the Omega.
-- = A record containing a List A, which can be thought of as a prefix of an infinite list.
record Omega (A : Set) : Set where
  constructor MkOmega
  field
    runOmega : List A
