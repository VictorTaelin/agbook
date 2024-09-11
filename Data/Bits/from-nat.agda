module Data.Bits.from-nat where

open import Data.Bits.Type
open import Data.Bits.reverse
open import Data.Bits.normal
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.div
open import Data.Nat.eq
open import Data.Nat.is-zero
open import Data.Nat.mod

-- Converts a natural number to its corresponding Bits representation.
-- The rightmost bit is the least significant.
-- - n: The natural number to convert.
-- = The Bits representation of the natural number, normalized.
from-nat : Nat → Bits
from-nat Zero = E
from-nat n    = normal (go n (λ x → x)) where
  go : Nat → (Bits → Bits) → Bits
  go Zero acc = acc E
  go n    acc = do
    let rem = mod n 2
    let quo = div n 2
    let ctr = if rem == 0 then O else I
    go quo (λ x → acc (ctr x))
