module Data.U64.mul where

open import Data.U64.Type
open import Data.Nat.mul

-- Multiplies two U64 values.
-- - a: The first U64 to multiply.
-- - b: The second U64 to multiply.
-- = The result of a * b, potentially wrapping around due to 64-bit limitation.
mulU64 : U64 → U64 → U64
mulU64 a b = primWord64FromNat (primWord64ToNat a * primWord64ToNat b)
