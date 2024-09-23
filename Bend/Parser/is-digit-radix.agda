module Bend.Parser.is-digit-radix where

open import Base.Char.Type
open import Base.Char.is-digit
open import Base.Char.is-hex-digit
open import Base.Char.eq
open import Base.Nat.Type
open import Base.Bool.Type
open import Base.Bool.or

-- | Checks if a character is a valid digit for the given radix.
-- - radix: The numeric base (2 for binary, 10 for decimal, 16 for hexadecimal).
-- - c: The character to check.
-- = True if the character is a valid digit for the given radix, False otherwise.
-- = Accepts underscores for any radix.
is-digit-radix : Nat → Char → Bool
is-digit-radix _ '_' = True
is-digit-radix 16 c  = is-hex-digit c
is-digit-radix 2  c  = (c == '0') || (c == '1')
is-digit-radix 10 c  = is-digit c
is-digit-radix _  _  = False
