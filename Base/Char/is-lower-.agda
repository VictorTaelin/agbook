module Base.Char.is-lower- where

open import Base.Char.Char
open import Base.Char.is-lower
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: Lowercase 'a' is considered lowercase
T0 : is-lower 'a' ≡ True
T0 = refl

-- Test: Uppercase 'A' is not considered lowercase
T1 : is-lower 'A' ≡ False
T1 = refl

-- Test: Digit '5' is not considered lowercase
T2 : is-lower '5' ≡ False
T2 = refl

-- Test: Special character '@' is not considered lowercase
T3 : is-lower '@' ≡ False
T3 = refl

