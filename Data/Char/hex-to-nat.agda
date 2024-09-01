module Data.Char.hex-to-nat where

open import Data.Char.Type
open import Data.Nat.Type
open import Data.Maybe.Type
open import Data.Char.digit-to-nat

-- Converts a hexadecimal character to its corresponding natural number
hex-to-nat : Char → Maybe Nat
hex-to-nat c with digit-to-nat c
... | Some n = Some n
... | None   = aux c where
  aux : Char → Maybe Nat
  aux 'a' = Some 10
  aux 'b' = Some 11
  aux 'c' = Some 12
  aux 'd' = Some 13
  aux 'e' = Some 14
  aux 'f' = Some 15
  aux 'A' = Some 10
  aux 'B' = Some 11
  aux 'C' = Some 12
  aux 'D' = Some 13
  aux 'E' = Some 14
  aux 'F' = Some 15
  aux _   = None
