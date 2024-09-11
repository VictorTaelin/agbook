module Data.U64.xor where

open import Data.U64.Type
open import Data.Nat.Type

-- Performs bitwise XOR operation on two U64 values.
-- - x: The first U64 value.
-- - y: The second U64 value.
-- = The result of bitwise XOR on x and y.
xor : U64 → U64 → U64
xor x y = primU64Xor x y
  where
    postulate primU64Xor : U64 → U64 → U64
