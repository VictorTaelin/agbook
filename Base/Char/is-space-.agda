module Base.Char.is-space- where

open import Base.Char.Char
open import Base.Char.is-space
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: Space character is a whitespace
T0 : is-space ' ' ≡ True
T0 = refl

-- Test: Newline character is a whitespace
T1 : is-space '\n' ≡ True
T1 = refl

-- Test: Tab character is a whitespace
T2 : is-space '\t' ≡ True
T2 = refl

-- Test: Regular letter 'A' is not a whitespace
T3 : is-space 'A' ≡ False
T3 = refl

-- Test: Digit '5' is not a whitespace
T4 : is-space '5' ≡ False
T4 = refl

-- Test: Special character '!' is not a whitespace
T5 : is-space '!' ≡ False
T5 = refl

