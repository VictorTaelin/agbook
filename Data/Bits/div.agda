module Data.Bits.div where

open import Data.Bits.Type
open import Data.Bits.to-nat
open import Data.Nat.Type
open import Data.Nat.div
open import Data.Nat.mod
open import Data.Bits.from-nat

-- Perform bit division by converting to Nat, dividing, and converting back to Bits
divB : Bits → Bits → Bits
divB a b = from-nat (div (to-nat a) (to-nat b))

-- Infix operator for Bits addition
_/_ : Bits → Bits → Bits
_/_ = divB

infixl 6 _/_
