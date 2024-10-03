module Base.Char.hex-to-nat where

open import Base.Char.Char
open import Base.Function.case
open import Base.Nat.Nat
open import Base.Maybe.Maybe
open import Base.Char.digit-to-nat

-- Converts a hexadecimal character to its corresponding natural number.
-- 1st: The input hexadecimal character.
-- = Some n if c is a valid hexadecimal digit, where n is the corresponding natural number.
-- = None if c is not a valid hexadecimal digit.
hex-to-nat : Char → Maybe Nat
hex-to-nat c = do
  let digit = digit-to-nat c
  case digit of λ where
    (Some n) → Some n
    None     → aux c
  where
  -- Auxiliary function to handle hexadecimal digits A-F (case-insensitive).
  -- 1st: The input character.
  -- = Some n where n is the corresponding natural number for hexadecimal digits A-F, None for any other character.
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
