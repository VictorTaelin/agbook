module Data.Word64.from-nat where

open import Data.Nat.Type
open import Data.Word64.Type

from-nat : Nat → Word64
from-nat = primWord64FromNat
