module Base.U64.not where

open import Base.U64.U64
open import Base.Bits.Bits
open import Base.Bits.to-nat
open import Base.Bits.not renaming (not to notB; ~_ to ~n_)
open import Base.Nat.Nat
open import Base.U64.to-bits
open import Base.U64.from-nat

-- Performs bitwise NOT operation on a U64 value.
-- - x: The U64 value to be negated.
-- = The result of bitwise NOT on x.
not : U64 → U64
not x = from-nat (to-nat (notB (to-bits x)))

infix 9 ~_
~_ : U64 → U64
~_ = not

