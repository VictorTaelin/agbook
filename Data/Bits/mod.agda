module Data.Bits.mod where

open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Nat.Type
open import Data.Nat.mod using () renaming (mod to nat-mod)
open import Data.Bits.from-nat

-- FIXME: implement proper bitwise algorithm?

-- Perform bit modulo operation by converting to Nat, performing modulo, and converting back to Bits
-- - a: The dividend (Bits).
-- - b: The divisor (Bits).
-- = The remainder of a modulo b (Bits).
mod : Bits → Bits → Bits
mod a b = from-nat (nat-mod (to-nat a) (to-nat b))

-- Infix operator for Bits modulo
_%_ : Bits → Bits → Bits
_%_ = mod

infixl 7 _%_
