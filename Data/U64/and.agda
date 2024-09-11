module Data.U64.and where

open import Data.U64.Type
open import Data.Nat.Type

-- Performs bitwise AND operation on two U64 values.
-- - x: The first U64 value.
-- - y: The second U64 value.
-- = The result of bitwise AND on x and y.
and : U64 → U64 → U64
and x y = primU64And x y
  where
    postulate primU64And : U64 → U64 → U64
