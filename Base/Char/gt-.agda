module Base.Char.gt- where

open import Base.Char.Char
open import Base.Char.gt
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: 'b' is greater than 'a'
T0 : gt 'b' 'a' ≡ True
T0 = refl

-- Test: 'a' is not greater than 'b'
T1 : gt 'a' 'b' ≡ False
T1 = refl

-- Test: 'A' is not greater than 'a' (uppercase comes before lowercase in ASCII)
T2 : gt 'A' 'a' ≡ False
T2 = refl

-- Test: 'z' is greater than 'a'
T3 : gt 'z' 'a' ≡ True
T3 = refl

-- Test: '9' is greater than '0'
T4 : gt '9' '0' ≡ True
T4 = refl

-- Test: '~' is greater than '!'
T5 : gt '~' '!' ≡ True
T5 = refl

-- Test: 'a' is not greater than 'a'
T6 : gt 'a' 'a' ≡ False
T6 = refl