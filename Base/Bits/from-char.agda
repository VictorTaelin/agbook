module Base.Bits.from-char where

open import Base.Bits.Bits
open import Base.Nat.to-bits
open import Base.Bits.pad-zeros
open import Base.Char.Char
import Base.Char.to-nat as C

from-char : Char → Bits
from-char char = pad-zeros 21 (to-bits (C.to-nat char))

