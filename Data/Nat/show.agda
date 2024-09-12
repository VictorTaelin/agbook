module Data.Nat.show where

open import Data.Nat.Type
open import Data.String.Type

-- Converts a natural number to its string representation.
show : Nat → String
show = primShowNat
