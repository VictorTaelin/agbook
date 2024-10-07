module Base.Char.is-octal-digit- where

open import Base.Char.Char
open import Base.Char.is-octal-digit
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Tests for the is-octal-digit function.

-- Test: Checks if '0' is recognized as an octal digit.
T0 : is-octal-digit '0' ≡ True
T0 = refl

-- Test: Checks if '7' is recognized as an octal digit.
T1 : is-octal-digit '7' ≡ True
T1 = refl

-- Test: Checks if '8' is not recognized as an octal digit.
T2 : is-octal-digit '8' ≡ False
T2 = refl

-- Test: Checks if 'a' is not recognized as an octal digit.
T3 : is-octal-digit 'a' ≡ False
T3 = refl