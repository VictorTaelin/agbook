module Base.U64.from-nat where

open import Base.U64.Type
open import Base.Nat.Type
open import Base.Nat.to-u64

from-nat : Nat → U64
from-nat = to-u64
