module Data.String.to-nat-base where

open import Data.Nat.Type
open import Data.String.Type
open import Data.Char.Type
open import Data.Maybe.Type
open import Data.List.Type
open import Data.String.to-list
open import Data.Nat.add
open import Data.Nat.mul
open import Data.Char.to-digit
open import Data.Function.case

-- Converts a string to a natural number in the given base
to-nat-base : Nat → String → Maybe Nat
to-nat-base base s = go (to-list s) 0 where
  go : List Char → Nat → Maybe Nat
  go []        acc = Some acc
  go (c :: cs) acc = 
    case to-digit base c of λ where
      (Some d) → go cs (add (mul acc base) d)
      None     → None
