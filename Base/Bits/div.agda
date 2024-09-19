module Base.Bits.div where

open import Base.Bits.Type
open import Base.Bits.to-nat
open import Base.Nat.Type
open import Base.Nat.div using () renaming (div to nat-div)
open import Base.Bits.from-nat

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
