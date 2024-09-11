module Data.U64.sub where

open import Data.U64.Type
open import Data.Nat.sub renaming (_-_ to _n-_; sub to nsub)
open import Data.Nat.add

-- Subtracts one U64 from another.
-- - a: The U64 to subtract from.
-- - b: The U64 to subtract.
-- = The result of a - b, wrapping around if b > a.
sub : U64 → U64 → U64
sub a b = primWord64FromNat ((primWord64ToNat a + 18446744073709551616) n- primWord64ToNat b)

infixl 6 _-_
_-_ : U64 → U64 → U64
_-_ = sub
