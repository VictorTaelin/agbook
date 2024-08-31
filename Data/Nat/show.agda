module Data.Nat.show where

open import Data.Nat.Main
open import Data.Nat.div
open import Data.Nat.eq
open import Data.Nat.mod
open import Data.String.Main
open import Data.String.append

-- Converts a single digit to its string representation.
show_decimal : Nat → String
show_decimal 0 = "0"
show_decimal 1 = "1"
show_decimal 2 = "2"
show_decimal 3 = "3"
show_decimal 4 = "4"
show_decimal 5 = "5"
show_decimal 6 = "6"
show_decimal 7 = "7"
show_decimal 8 = "8"
show_decimal 9 = "9"
show_decimal _ = "_" -- This case should never happen if used correctly

show_helper : Nat → String → String
show_helper zero k = k
show_helper n    k =
  let q = div n 10 in
  let r = mod n 10 in
  show_helper q (show_decimal r ++ k)

-- Converts a natural number to its string representation.
-- - n: The natural number to convert.
-- = A string representation of the number.
show : Nat → String
show zero = "0"
show n    = show_helper n ""
