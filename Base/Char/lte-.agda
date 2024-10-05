module Base.Char.lte- where

open import Base.Bool.Bool
open import Base.Char.Char
open import Base.Char.lte
open import Base.Equal.Equal

-- Test: 'a' is less than or equal to 'b'
T0 : ('a' <= 'b') ≡ True
T0 = refl

-- Test: 'b' is not less than or equal to 'a'
T1 : ('b' <= 'a') ≡ False
T1 = refl

-- Test: 'A' is less than or equal to 'A' (equality case)
T2 : ('A' <= 'A') ≡ True
T2 = refl

-- Test: 'z' is less than or equal to 'z' (equality case)
T3 : ('z' <= 'z') ≡ True
T3 = refl

-- Test: '0' is less than or equal to '9'
T4 : ('0' <= '9') ≡ True
T4 = refl

-- Test: 'Z' is less than or equal to 'a'
T5 : ('Z' <= 'a') ≡ True
T5 = refl

-- Test: '~' is not less than or equal to '!'
T6 : ('~' <= '!') ≡ False
T6 = refl