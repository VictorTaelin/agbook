module Data.U64.not where

open import Data.U64.Type
open import Data.Nat.Type

-- Performs bitwise NOT operation on a U64 value.
-- - x: The U64 value to be negated.
-- = The result of bitwise NOT on x.
not : U64 → U64
not x = primU64Not x
  where
    postulate primU64Not : U64 → U64
