module Base.Char.to-nat- where

open import Base.Char.Char
open import Base.Char.to-nat
open import Base.Nat.Nat
open import Base.Equal.Equal

-- Test: Convert 'A' to its ASCII value
T0 : to-nat 'A' ≡ 65
T0 = refl

-- Test: Convert '0' to its ASCII value
T1 : to-nat '0' ≡ 48
T1 = refl

-- Test: Convert 'z' to its ASCII value
T2 : to-nat 'z' ≡ 122
T2 = refl

-- Test: Convert space character to its ASCII value
T3 : to-nat ' ' ≡ 32
T3 = refl

-- Test: Convert newline character to its ASCII value
T4 : to-nat '\n' ≡ 10
T4 = refl