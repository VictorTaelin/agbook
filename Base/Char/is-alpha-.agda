module Base.Char.is-alpha- where

open import Base.Char.Char
open import Base.Char.is-alpha
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: Lowercase 'a' is alphabetic
T0 : is-alpha 'a' ≡ True
T0 = refl

-- Test: Uppercase 'Z' is alphabetic
T1 : is-alpha 'Z' ≡ True
T1 = refl

-- Test: Digit '5' is not alphabetic
T2 : is-alpha '5' ≡ False
T2 = refl

-- Test: Special character '@' is not alphabetic
T3 : is-alpha '@' ≡ False
T3 = refl