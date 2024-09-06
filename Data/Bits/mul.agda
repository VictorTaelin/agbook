module Data.Bits.mul where

open import Data.Bits.Type
open import Data.Bits.add
open import Data.Bits.and
open import Data.Bits.strip
open import Data.Bits.pad-length
open import Data.Pair.fst
open import Data.Pair.snd

-- Performs multiplication of two Bits values.
-- - a: The first Bits value.
-- - b: The second Bits value.
-- = A new Bits value representing the product of a and b.
mul : Bits → Bits → Bits
mul a b = 
  let padded = pad-length a b
      a' = fst padded
      b' = snd padded
      result = mul' a' b'
  in strip result
  where
    mul' : Bits → Bits → Bits
    mul' E        _        = E
    mul' _        E        = E
    mul' (O a)    b        = O (mul' a b)
    mul' (I a)    b        = b + (O (mul' a b))

-- Infix operator for Bits multiplication
_*_ : Bits → Bits → Bits
_*_ = mul

infixl 7 _*_
