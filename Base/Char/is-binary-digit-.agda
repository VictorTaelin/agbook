module Base.Char.is-binary-digit- where

open import Base.Char.Char
open import Base.Char.is-binary-digit
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Tests
T0 : is-binary-digit '0' ≡ True
T0 = refl

T1 : is-binary-digit '1' ≡ True
T1 = refl

T2 : is-binary-digit '2' ≡ False
T2 = refl

T3 : is-binary-digit 'a' ≡ False
T3 = refl