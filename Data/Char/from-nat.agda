module Data.Char.from-nat where

open import Data.Char.Type
open import Data.Nat.Type

primitive
  primNatToChar : Nat → Char

from-nat : Nat → Char
from-nat = primNatToChar
