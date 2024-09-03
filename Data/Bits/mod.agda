module Data.Bits.mod where

open import Data.Bits.Type
open import Data.Bits.sub
open import Data.Bits.lt
open import Data.Bits.eq
open import Data.Maybe.Type
open import Data.Bool.if

-- Helper function to perform modulo
mod-helper : Bits → Bits → Bits
mod-helper dividend divisor =
  if dividend < divisor
  then dividend
  else mod-helper (dividend - divisor) divisor

-- Performs modulo operation of two Bits values.
-- - dividend: The Bits value to be divided.
-- - divisor: The Bits value to divide by.
-- = A Maybe Bits representing the remainder,
--   or None if modulo by zero is attempted.
mod : Bits → Bits → Maybe Bits
mod _ E = None
mod dividend divisor = Some (mod-helper dividend divisor)

-- Infix operator for Bits modulo
_%_ : Bits → Bits → Maybe Bits
_%_ = mod

infixl 7 _%_