module Base.Bits.eq where

open import Base.Bits.Bits
open import Base.Bool.Bool

-- Checks if two Bits values are equal.
-- - a: The 1st Bits value.
-- - b: The 2nd Bits value.
-- = True if a and b are equal, False otherwise.
eq : Bits → Bits → Bool
eq E     E     = True
eq (O x) (O y) = eq x y
eq (I x) (I y) = eq x y
eq _     _     = False

infix 4 _==_
_==_ : Bits → Bits → Bool
_==_ = eq

