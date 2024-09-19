module Base.String.to-nat-base where

open import Base.Nat.Type
open import Base.String.Type
open import Base.Char.Type
open import Base.Maybe.Type
open import Base.List.Type
open import Base.String.to-list
open import Base.Nat.add
open import Base.Nat.mul
open import Base.Char.to-digit
open import Base.Function.case

-- Converts a string to a natural number in the given base
to-nat-base : Nat → String → Maybe Nat
to-nat-base base s = go (to-list s) 0 where
  go : List Char → Nat → Maybe Nat
  go []        acc = Some acc
  go (c :: cs) acc = 
    case to-digit base c of λ where
      (Some d) → go cs (add (mul acc base) d)
      None     → None
