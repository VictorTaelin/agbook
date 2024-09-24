module Base.Char.from-nat where

open import Base.Char.Type
open import Base.Nat.Type

primitive
  primNatToChar : Nat -> Char

from-nat : Nat -> Char
from-nat = primNatToChar
