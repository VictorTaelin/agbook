module Data.Float.from-string where

open import Data.Char.Type
open import Data.Char.eq
open import Data.Char.digit-to-nat
open import Data.Function.case
open import Data.Float.Type
open import Data.Float.Operations
open import Data.Int.Type
open import Data.List.Type
open import Data.List.map
open import Data.List.length
open import Data.List.split-at
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Nat.mul
open import Data.Nat.add
open import Data.Nat.exp
open import Data.Pair.Type
open import Data.String.Type
open import Data.String.to-list

digits-to-nat : List Char → List (Maybe Nat)
digits-to-nat = map digit-to-nat

-- Auxiliary function to accumulate the result
nat-digits-to-number-helper : Nat → List (Maybe Nat) → Maybe Nat
nat-digits-to-number-helper acc []             = Some acc
nat-digits-to-number-helper acc (None :: _)    = None
nat-digits-to-number-helper acc (Some x :: xs) = nat-digits-to-number-helper ((acc * 10) + x) xs

-- Main function to convert a list of Maybe Nat to Maybe Nat
nat-digits-to-number : List (Maybe Nat) → Maybe Nat
nat-digits-to-number xs = nat-digits-to-number-helper Zero (xs)

split-float-string : List Char → Pair (List Char) (List Char)
split-float-string char-list = split-at eq '.' char-list

-- Modified function to convert a string to Maybe Float
from-string : String → Maybe Float
from-string s =
  let char-list = to-list s
      (int-part , frac-part) = split-float-string char-list
      len-frac = length frac-part
      frac-divisor = 10 ^ len-frac
      int-value = nat-digits-to-number (digits-to-nat int-part)
      frac-value = nat-digits-to-number (digits-to-nat frac-part)

  in case int-value of λ where
       None → None
       (Some i) → case frac-value of λ where
         None → None
         (Some f) → Some (primIntToFloat (Pos i) f+ (primRatioToFloat (Pos f) (Pos frac-divisor)))
