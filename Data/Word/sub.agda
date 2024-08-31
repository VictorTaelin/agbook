module Data.Word.sub where

open import Data.Word.Type
open import Data.Nat.sub
open import Data.Nat.add

-- Subtracts one Word64 from another.
-- - a: The Word64 to subtract from.
-- - b: The Word64 to subtract.
-- = The result of a - b, wrapping around if b > a.
subWord : Word64 → Word64 → Word64
subWord a b = primWord64FromNat ((primWord64ToNat a + 18446744073709551616) - primWord64ToNat b)
