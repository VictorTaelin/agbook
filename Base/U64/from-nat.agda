module Base.U64.from-nat where

open import Base.U64.Type
open import Base.Nat.Type

primitive
  primWord64FromNat : Nat → U64

from-nat : Nat → U64
from-nat = primWord64FromNat
