module Data.Char.to-digit where

open import Data.Nat.Type
open import Data.Char.Type
open import Data.Maybe.Type
open import Data.Char.is-digit
open import Data.Char.is-hex-digit
open import Data.Char.digit-to-nat
open import Data.Char.hex-to-nat
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Nat.eq
open import Data.Trait.Eq
open import Data.Bool.and

-- Converts a single character to its numeric value in the given base
to-digit : Nat → Char → Maybe Nat
to-digit base c = 
  if is-digit c
  then digit-to-nat c
  else if (base == 16) && is-hex-digit c
       then hex-to-nat c
       else None
