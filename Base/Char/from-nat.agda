module Base.Char.from-nat where

open import Base.Char.Char
open import Base.Nat.Nat

primitive
  primNatToChar : Nat -> Char

from-nat : Nat -> Char
from-nat = primNatToChar
