module Base.Char.from-nat- where

open import Base.Char.Char
open import Base.Char.from-nat
open import Base.Equal.Equal
open import Base.Nat.Nat

-- Test: Convert 65 to character 'A'
T0 : from-nat 65 ≡ 'A'
T0 = refl

-- Test: Convert 97 to character 'a'
T1 : from-nat 97 ≡ 'a'
T1 = refl

-- Test: Convert 48 to character '0'
T2 : from-nat 48 ≡ '0'
T2 = refl

-- Test: Convert 0 to null character
T3 : from-nat 0 ≡ '\0'
T3 = refl

-- Test: Convert 32 to space character
T4 : from-nat 32 ≡ ' '
T4 = refl