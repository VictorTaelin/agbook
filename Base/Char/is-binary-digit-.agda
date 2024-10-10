module Base.Char.is-binary-digit- where

open import Base.Char.Char
open import Base.Char.is-binary-digit
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Tests the is-binary-digit function with various inputs.

-- Test: '0' is a binary digit.
T0 : is-binary-digit '0' ≡ True
T0 = refl

-- Test: '1' is a binary digit.
T1 : is-binary-digit '1' ≡ True
T1 = refl

-- Test: '2' is not a binary digit.
T2 : is-binary-digit '2' ≡ False
T2 = refl

-- Test: 'a' is not a binary digit.
T3 : is-binary-digit 'a' ≡ False
T3 = refl

