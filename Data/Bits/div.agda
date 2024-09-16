module Data.Bits.div where

open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Nat.Type
open import Data.Nat.div using () renaming (div to nat-div)
open import Data.Bits.from-nat

-- FIXME: implement proper bitwise algorithm?

-- Perform bit division by converting to Nat, dividing, and converting back to Bits
-- - a: The dividend (Bits).
-- - b: The divisor (Bits).
-- = The quotient of a divided by b (Bits).
div : Bits → Bits → Bits
div a b = from-nat (nat-div (to-nat a) (to-nat b))

-- Infix operator for Bits division
_/_ : Bits → Bits → Bits
_/_ = div

infixl 7 _/_
