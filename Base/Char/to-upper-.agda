module Base.Char.to-upper- where

open import Base.Char.Char
open import Base.Char.to-upper
open import Base.Equal.Equal

-- Test: Lowercase 'a' is converted to uppercase 'A'
T0 : to-upper 'a' ≡ 'A'
T0 = refl

-- Test: Uppercase 'A' remains unchanged
T1 : to-upper 'A' ≡ 'A'
T1 = refl

-- Test: Digit '5' remains unchanged
T2 : to-upper '5' ≡ '5'
T2 = refl

-- Test: Special character '@' remains unchanged
T3 : to-upper '@' ≡ '@'
T3 = refl

-- Test: Lowercase 'z' is converted to uppercase 'Z'
T4 : to-upper 'z' ≡ 'Z'
T4 = refl

-- Test: Space character remains unchanged
T5 : to-upper ' ' ≡ ' '
T5 = refl

-- Test: Newline character remains unchanged
T6 : to-upper '\n' ≡ '\n'
T6 = refl

