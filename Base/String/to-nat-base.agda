module Base.String.to-nat-base where

open import Base.Char.Char
open import Base.Char.to-digit
open import Base.Function.case
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.mul
open import Base.String.String
open import Base.String.to-list

-- Converts a string to a natural number in the given base.
-- - 1st: The base to use for conversion.
-- - 2nd: The string to convert.
-- = A Maybe Nat, where Some n is the converted number if successful, or None if conversion fails.
to-nat-base : Nat -> String -> Maybe Nat
to-nat-base base s with to-list s
... | [] = None
... | cs = to-nat-base-go cs 0 where
  to-nat-base-go : List Char -> Nat -> Maybe Nat
  to-nat-base-go []       acc = Some acc
  to-nat-base-go (c :: cs) acc = 
    case to-digit base c of λ where
      (Some d) → to-nat-base-go cs (add (mul acc base) d)
      None     → None