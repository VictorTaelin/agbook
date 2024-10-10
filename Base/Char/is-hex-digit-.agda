module Base.Char.is-hex-digit- where

open import Base.Char.Char
open import Base.Char.is-hex-digit
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: Digit '5' is a hexadecimal digit
T0 : is-hex-digit '5' ≡ True
T0 = refl

-- Test: Uppercase 'A' is a hexadecimal digit
T1 : is-hex-digit 'A' ≡ True
T1 = refl

-- Test: Lowercase 'f' is a hexadecimal digit
T2 : is-hex-digit 'f' ≡ True
T2 = refl

-- Test: Letter 'G' is not a hexadecimal digit
T3 : is-hex-digit 'G' ≡ False
T3 = refl

-- Test: Special character '@' is not a hexadecimal digit
T4 : is-hex-digit '@' ≡ False
T4 = refl

