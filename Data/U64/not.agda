module Data.U64.not where

open import Data.U64.Type
open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Bits.not renaming (not to notB; ~_ to ~n_)
open import Data.Nat.Type
open import Data.U64.to-bits

-- Performs bitwise NOT operation on a U64 value.
-- - x: The U64 value to be negated.
-- = The result of bitwise NOT on x.
not : U64 → U64
not x = primWord64FromNat (to-nat (notB (to-bits x)))

infix 9 ~_
~_ : U64 → U64
~_ = not
