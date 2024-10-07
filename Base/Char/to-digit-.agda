module Base.Char.to-digit- where

open import Base.Char.to-digit
open import Base.Char.Char
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Equal.Equal

-- Test: Convert '5' to digit in base 10
T0 : to-digit 10 '5' ≡ Some 5
T0 = refl

-- Test: Convert 'A' to digit in base 16
T1 : to-digit 16 'A' ≡ Some 10
T1 = refl

-- Test: Convert 'G' to digit in base 16 (invalid hexadecimal digit)
T2 : to-digit 16 'G' ≡ None
T2 = refl

-- Test: Convert '9' to digit in base 8 (invalid octal digit)
T3 : to-digit 8 '9' ≡ None
T3 = refl

-- Test: Convert '0' to digit in base 2
T4 : to-digit 2 '0' ≡ Some 0
T4 = refl

-- Test: Convert 'F' to digit in base 10 (invalid decimal digit)
T5 : to-digit 10 'F' ≡ None
T5 = refl