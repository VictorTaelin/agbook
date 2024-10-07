module Base.Char.is-digit- where

open import Base.Char.Char
open import Base.Char.is-digit
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: '0' is a digit
T0 : is-digit '0' ≡ True
T0 = refl

-- Test: '9' is a digit
T1 : is-digit '9' ≡ True
T1 = refl

-- Test: '5' is a digit
T2 : is-digit '5' ≡ True
T2 = refl

-- Test: 'a' is not a digit
T3 : is-digit 'a' ≡ False
T3 = refl

-- Test: 'A' is not a digit
T4 : is-digit 'A' ≡ False
T4 = refl

-- Test: ' ' (space) is not a digit
T5 : is-digit ' ' ≡ False
T5 = refl

-- Test: '-' is not a digit
T6 : is-digit '-' ≡ False
T6 = refl

-- Test: '/' is not a digit (just before '0' in ASCII)
T7 : is-digit '/' ≡ False
T7 = refl

-- Test: ':' is not a digit (just after '9' in ASCII)
T8 : is-digit ':' ≡ False
T8 = refl