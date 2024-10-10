module Base.Char.is-special- where

open import Base.Char.Char
open import Base.Char.is-special
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: Special character (e.g., '@') should return True
T0 : is-special '@' ≡ True
T0 = refl

-- Test: Alphabetic character should return False
T1 : is-special 'A' ≡ False
T1 = refl

-- Test: Digit should return False
T2 : is-special '5' ≡ False
T2 = refl

-- Test: Non-printable character should return False
T3 : is-special '\x0000' ≡ False
T3 = refl

-- Test: Another special character (e.g., '#') should return True
T4 : is-special '#' ≡ True
T4 = refl

