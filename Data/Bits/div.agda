module Data.Bits.div where

open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Nat.Type
open import Data.Nat.div
open import Data.Nat.mul
open import Data.Nat.eq
open import Data.Bool.if

-- Performs division of two Bits values.
-- - dividend: The Bits value to be divided.
-- - divisor: The Bits value to divide by.
-- = A Bits value representing the quotient of the division.
div : Bits → Bits → Bits
div dividend divisor = 
  let dividend-nat = to-nat dividend
      divisor-nat = to-nat divisor
      result-nat = div dividend-nat divisor-nat
  in nat-to-bits result-nat
  where
    -- Helper function to convert Nat back to Bits
    nat-to-bits : Nat → Bits
    nat-to-bits Zero = E
    nat-to-bits (Succ n) = 
      if (n == Zero)
      then I E
      else if ((n `mod` 2) == Zero)
           then O (nat-to-bits (n `div` 2))
           else I (nat-to-bits (n `div` 2))

-- Infix operator for Bits division
_/_ : Bits → Bits → Bits
_/_ = div

infixl 7 _/_
