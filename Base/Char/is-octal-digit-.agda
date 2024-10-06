module Base.Char.is-octal-digit- where

open import Base.Char.Char
open import Base.Char.is-octal-digit
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Tests
T0 : is-octal-digit '0' ≡ True
T0 = refl

T1 : is-octal-digit '7' ≡ True
T1 = refl

T2 : is-octal-digit '8' ≡ False
T2 = refl

T3 : is-octal-digit 'a' ≡ False
T3 = refl