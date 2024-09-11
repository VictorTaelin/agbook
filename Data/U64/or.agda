module Data.U64.or where

open import Data.U64.Type
open import Data.Nat.Type

-- Performs bitwise OR operation on two U64 values.
-- - x: The first U64 value.
-- - y: The second U64 value.
-- = The result of bitwise OR on x and y.
or : U64 → U64 → U64
or x y = primU64Or x y
  where
    postulate primU64Or : U64 → U64 → U64