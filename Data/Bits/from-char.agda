module Data.Bits.from-char where

open import Data.Bits.Type
import Data.Bits.from-nat as B
open import Data.Bits.with-depth
open import Data.Char.Type
import Data.Char.to-nat as C

from-char : Char → Bits
from-char char = with-depth 8 (B.from-nat (C.to-nat char))
