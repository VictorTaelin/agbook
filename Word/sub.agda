module Word.sub where

open import Word.Main
open import Nat.minus
open import Nat.add

-- Subtracts one Word64 from another.
-- - a: the Word64 to subtract from.
-- - b: the Word64 to subtract.
-- = The result of a - b, wrapping around if b > a.
subWord : Word64 → Word64 → Word64
subWord a b = primWord64FromNat ((primWord64ToNat a + 18446744073709551616) - primWord64ToNat b)
