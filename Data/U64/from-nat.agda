module Data.U64.from-nat where

open import Data.U64.Type
open import Data.Nat.Type

from-nat : Nat → U64
from-nat = primWord64FromNat