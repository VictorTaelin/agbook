module Base.Bits.is-zero where

open import Base.Bits.Bits
open import Base.Bool.Bool
open import Base.Bool.and

-- Checks if a number in bits is zero or empty.
-- - n: The number of bits to use.
-- = True if the number is zero and false otherwise.
is-zero : Bits → Bool
is-zero E        = True
is-zero (O bits) = True && is-zero bits
is-zero (I bits) = False
