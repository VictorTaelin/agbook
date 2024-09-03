module Data.Bits.from-nat where

open import Data.Bits.Type
open import Data.Bits.inc
open import Data.Nat.Type

-- Transforms a natural number into its bits representation.
from-nat : Nat → Bits
from-nat Zero = E
from-nat (Succ n) = (inc (from-nat n))
