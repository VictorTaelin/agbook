module Base.Char.to-lower- where

open import Base.Char.Char
open import Base.Char.to-lower
open import Base.Equal.Equal

-- Test: Uppercase 'A' is converted to lowercase 'a'
T0 : to-lower 'A' ≡ 'a'
T0 = refl

-- Test: Lowercase 'a' remains unchanged
T1 : to-lower 'a' ≡ 'a'
T1 = refl

-- Test: Digit '5' remains unchanged
T2 : to-lower '5' ≡ '5'
T2 = refl

-- Test: Special character '@' remains unchanged
T3 : to-lower '@' ≡ '@'
T3 = refl

-- Test: Uppercase 'Z' is converted to lowercase 'z'
T4 : to-lower 'Z' ≡ 'z'
T4 = refl

