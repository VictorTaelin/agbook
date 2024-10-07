module Base.Char.is-latin1- where

open import Base.Char.Char
open import Base.Char.to-nat
open import Base.Char.is-latin1
open import Base.Bool.Bool
open import Base.Nat.lte
open import Base.Equal.Equal

-- Tests for the is-latin1 function.

-- Test: ASCII character 'A' (code point 65).
T0 : is-latin1 'A' ≡ True
T0 = refl

-- Test: Latin-1 character 'ñ' (code point 241).
T1 : is-latin1 'ñ' ≡ True
T1 = refl

-- Test: Latin-1 character '¿' (code point 191).
T2 : is-latin1 '¿' ≡ True
T2 = refl

-- Test: Latin-1 character 'ÿ' (code point 255).
T3 : is-latin1 'ÿ' ≡ True
T3 = refl

-- Test: Non-Latin-1 character '€' (code point 8364).
T4 : is-latin1 '€' ≡ False
T4 = refl

-- Test: ASCII control character NUL (code point 0).
T5 : is-latin1 '\x0000' ≡ True
T5 = refl