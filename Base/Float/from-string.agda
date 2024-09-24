module Base.Float.from-string where

open import Base.Bool.if
open import Base.Bool.Type
open import Base.Char.eq
open import Base.Char.digit-to-nat
open import Base.Char.Type
open import Base.Float.Type
import Base.Float.add as Float
open import Base.Float.negate
open import Base.Function.case
open import Base.Int.Type
open import Base.List.length
open import Base.List.map
open import Base.List.split-at-element
open import Base.List.Type
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.mul
open import Base.Nat.add
open import Base.Nat.exp
open import Base.Pair.Type
open import Base.String.drop
open import Base.String.to-list
open import Base.String.Type

primitive
  primIntToFloat : Int -> Float
  primRatioToFloat : Int -> Int -> Float

digits-to-nat : List Char -> List (Maybe Nat)
digits-to-nat = map digit-to-nat

-- Auxiliary function to accumulate the result
nat-digits-to-number-helper : Nat -> List (Maybe Nat) -> Maybe Nat
nat-digits-to-number-helper acc []             = Some acc
nat-digits-to-number-helper acc (None :: _)    = None
nat-digits-to-number-helper acc (Some x :: xs) = nat-digits-to-number-helper ((acc * 10) + x) xs

-- Main function to convert a list of Maybe Nat to Maybe Nat
nat-digits-to-number : List (Maybe Nat) -> Maybe Nat
nat-digits-to-number xs = nat-digits-to-number-helper Zero (xs)

split-float-string : List Char -> Pair (List Char) (List Char)
split-float-string char-list = split-at-element eq '.' char-list

extract-sign : String -> Pair Bool String
extract-sign s = case to-list s of λ where
  [] -> False , s
  (x :: xs) -> if (x == '-')
               then True , drop 1 s
               else if (x == '+')
                    then False , drop 1 s
                    else False , s

from-string : String -> Maybe Float
from-string s =
  let (is-neg , str) = extract-sign s 
      char-list = to-list str
      (int-part , frac-part) = split-float-string char-list
      len-frac = length frac-part
      frac-divisor = 10 ** len-frac
      int-value = nat-digits-to-number (digits-to-nat int-part)
      frac-value = nat-digits-to-number (digits-to-nat frac-part)

  in case int-value of λ where
       None -> None
       (Some i) -> case frac-value of λ where
         None -> None
         (Some f) -> 
            let abs-value = primIntToFloat (Pos i) Float.+ (primRatioToFloat (Pos f) (Pos frac-divisor))
            in Some (if is-neg then (negate abs-value) else abs-value)
