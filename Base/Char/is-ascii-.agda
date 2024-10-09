module Base.Char.is-ascii- where

open import Base.Bool.Bool
open import Base.Char.Char
open import Base.Char.is-ascii
open import Base.Nat.Nat
open import Base.Equal.Equal

-- Test: ASCII character 'A' (code point 65).
T0 : is-ascii 'A' ≡ True
T0 = refl

-- Test: Non-ASCII character '€' (code point 8364).
T1 : is-ascii '€' ≡ False
T1 = refl

-- Test: ASCII character '~' (code point 126).
T2 : is-ascii '~' ≡ True
T2 = refl

-- Test: ASCII character DEL (code point 127).
T3 : is-ascii '\x7F' ≡ True
T3 = refl

-- Test: Non-ASCII character 'ñ' (code point 241).
T4 : is-ascii 'ñ' ≡ False
T4 = refl

