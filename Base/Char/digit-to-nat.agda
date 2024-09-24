module Base.Char.digit-to-nat where

open import Base.Char.Type
open import Base.Nat.Type
open import Base.Maybe.Type

-- Converts a digit character to its corresponding natural number
digit-to-nat : Char -> Maybe Nat
digit-to-nat '0' = Some 0
digit-to-nat '1' = Some 1
digit-to-nat '2' = Some 2
digit-to-nat '3' = Some 3
digit-to-nat '4' = Some 4
digit-to-nat '5' = Some 5
digit-to-nat '6' = Some 6
digit-to-nat '7' = Some 7
digit-to-nat '8' = Some 8
digit-to-nat '9' = Some 9
digit-to-nat _   = None
