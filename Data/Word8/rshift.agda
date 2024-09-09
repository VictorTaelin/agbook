module Data.Word8.rshift where

open import Data.Word8.Type
open import Data.Nat.Type

-- Performs a right shift operation on a Word8 value.
-- - w: The Word8 value to be shifted.
-- - n: The number of positions to shift (as a Nat).
-- = The result of shifting w right by n positions.
postulate
  rshift : Word8 → Nat → Word8

{-# FOREIGN GHC import Data.Bits #-}
{-# COMPILE GHC rshift = \w n -> shiftR w (fromIntegral n) #-}
{-# COMPILE JS rshift = function(w) { return function(n) { return w >>> n; }; } #-}

-- Infix operator for right shift
_>>_ : Word8 → Nat → Word8
_>>_ = rshift

infixl 8 _>>_

open import Data.Word8.to-nat
open import Data.Word8.from-nat
open import Data.Equal.Type

test : to-nat (from-nat 2) == 2
test = refl