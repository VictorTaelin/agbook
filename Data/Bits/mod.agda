module Data.Bits.mod where

open import Data.Bits.Type
open import Data.Bits.div
open import Data.Bits.sub
open import Data.Bits.mul

-- Performs modulo operation on two Bits values.
-- - dividend: The Bits value to be divided.
-- - divisor: The Bits value to divide by.
-- = The remainder of the division as a Bits value.
mod : Bits → Bits → Bits
mod dividend divisor =
  let quotient = div dividend divisor
      product = mul quotient divisor
  in sub dividend product

-- Infix operator for Bits modulo
_%_ : Bits → Bits → Bits
_%_ = mod

infixl 7 _%_
