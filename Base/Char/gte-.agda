module Base.Char.gte- where

open import Base.Char.Char
open import Base.Char.gte
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: 'b' is greater than or equal to 'a'.
T0 : gte 'b' 'a' ≡ True
T0 = refl

-- Test: 'a' is not greater than or equal to 'b'.
T1 : gte 'a' 'b' ≡ False
T1 = refl

-- Test: 'A' is not greater than or equal to 'a' (uppercase comes before lowercase in ASCII).
T2 : gte 'A' 'a' ≡ False
T2 = refl

-- Test: 'z' is greater than or equal to 'a'.
T3 : gte 'z' 'a' ≡ True
T3 = refl

-- Test: '9' is greater than or equal to '0'.
T4 : gte '9' '0' ≡ True
T4 = refl

-- Test: '~' is greater than or equal to '!'.
T5 : gte '~' '!' ≡ True
T5 = refl

-- Test: 'a' is greater than or equal to 'a'.
T6 : gte 'a' 'a' ≡ True
T6 = refl

-- Test: 'Z' is greater than or equal to 'A'.
T7 : gte 'Z' 'A' ≡ True
T7 = refl

-- Test: '0' is greater than or equal to '0'.
T8 : gte '0' '0' ≡ True
T8 = refl

-- Test: 'a' is not greater than or equal to 'z'.
T9 : gte 'a' 'z' ≡ False
T9 = refl

