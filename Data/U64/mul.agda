module Data.U64.mul where

open import Data.U64.Type
open import Data.Nat.mul renaming (_*_ to _n*_; mul to nmul)

-- Multiplies two U64 values.
-- - a: The first U64 to multiply.
-- - b: The second U64 to multiply.
-- = The result of a * b, potentially wrapping around due to 64-bit limitation.
mul : U64 → U64 → U64
mul a b = primWord64FromNat (primWord64ToNat a n* primWord64ToNat b)

infixl 8 _*_
_*_ : U64 → U64 → U64
_*_ = mul
