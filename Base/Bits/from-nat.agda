module Base.Bits.from-nat where

open import Base.Bits.Type
open import Base.Bits.normal
open import Base.Bool.if
open import Base.Nat.Type
open import Base.Nat.div
open import Base.Nat.eq
open import Base.Nat.is-zero
open import Base.Nat.mod

-- Converts a natural number to its corresponding Bits representation.
-- The rightmost bit is the least significant.
-- - n: The natural number to convert.
-- = The Bits representation of the natural number, normalized.
{-# TERMINATING #-}
from-nat : Nat -> Bits
from-nat Zero = E
from-nat n    = normal (go n (λ x -> x)) where
  go : Nat -> (Bits -> Bits) -> Bits
  go Zero acc = acc E
  go n    acc = do
    let rem = mod n 2
    let quo = div n 2
    let ctr = if rem == 0 then O else I
    go quo (λ x -> acc (ctr x))
