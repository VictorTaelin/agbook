module Data.Bits.from-char where

open import Data.Bits.Type
open import Data.Nat.to-bits
open import Data.Bits.pad-zeros
open import Data.Char.Type
import Data.Char.to-nat as C

from-char : Char → Bits
from-char char = pad-zeros 8 (to-bits (C.to-nat char))
