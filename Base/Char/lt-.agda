module Base.Char.lt- where

open import Base.Bool.Bool
open import Base.Char.Char
open import Base.Char.lt
open import Base.Equal.Equal

-- Test: Compare lowercase 'a' with uppercase 'A'
T0 : ('a' < 'A') ≡ False
T0 = refl

-- Test: Compare lowercase 'a' with lowercase 'b'
T1 : ('a' < 'b') ≡ True
T1 = refl

-- Test: Compare uppercase 'Z' with lowercase 'a'
T2 : ('Z' < 'a') ≡ True
T2 = refl

-- Test: Compare same character
T3 : ('c' < 'c') ≡ False
T3 = refl