module Data.U64.sub where

open import Data.U64.Type
open import Data.Nat.sub
open import Data.Nat.add

-- Subtracts one U64 from another.
-- - a: The U64 to subtract from.
-- - b: The U64 to subtract.
-- = The result of a - b, wrapping around if b > a.
subU64 : U64 → U64 → U64
subU64 a b = primWord64FromNat ((primWord64ToNat a + 18446744073709551616) - primWord64ToNat b)
