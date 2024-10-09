module Base.Char.is-upper- where

open import Base.Char.Char
open import Base.Char.is-upper
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: Uppercase 'A' is considered uppercase
T0 : is-upper 'A' ≡ True
T0 = refl

-- Test: Lowercase 'a' is not considered uppercase
T1 : is-upper 'a' ≡ False
T1 = refl

-- Test: Digit '5' is not considered uppercase
T2 : is-upper '5' ≡ False
T2 = refl

-- Test: Special character '@' is not considered uppercase
T3 : is-upper '@' ≡ False
T3 = refl

