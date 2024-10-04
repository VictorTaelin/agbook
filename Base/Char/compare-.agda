module Base.Char.compare- where

open import Base.Char.Char
open import Base.Char.compare
open import Base.Ordering.Ordering
open import Base.Equal.Equal

-- Test: 'a' compared to 'a' is EQ
T0 : compare 'a' 'a' ≡ EQ
T0 = refl

-- Test: 'a' compared to 'b' is LT
T1 : compare 'a' 'b' ≡ LT
T1 = refl

-- Test: 'b' compared to 'a' is GT
T2 : compare 'b' 'a' ≡ GT
T2 = refl

-- Test: 'A' compared to 'a' is LT (uppercase comes before lowercase in ASCII)
T3 : compare 'A' 'a' ≡ LT
T3 = refl

-- Test: '0' compared to '9' is LT
T4 : compare '0' '9' ≡ LT
T4 = refl

-- Test: '!' compared to '~' is LT
T5 : compare '!' '~' ≡ LT
T5 = refl

-- Test: 'z' compared to 'a' is GT
T6 : compare 'z' 'a' ≡ GT
T6 = refl
