module Base.Char.compare- where

open import Base.Char.Char
open import Base.Char.compare
open import Base.Ordering.Ordering
open import Base.Equal.Equal

-- Test: Comparing 'a' with 'a' results in EQ.
T0 : compare 'a' 'a' ≡ EQ
T0 = refl

-- Test: Comparing 'a' with 'b' results in LT.
T1 : compare 'a' 'b' ≡ LT
T1 = refl

-- Test: Comparing 'b' with 'a' results in GT.
T2 : compare 'b' 'a' ≡ GT
T2 = refl

-- Test: Comparing 'A' with 'a' results in LT (uppercase comes before lowercase in ASCII).
T3 : compare 'A' 'a' ≡ LT
T3 = refl

-- Test: Comparing '0' with '9' results in LT.
T4 : compare '0' '9' ≡ LT
T4 = refl

-- Test: Comparing '!' with '~' results in LT.
T5 : compare '!' '~' ≡ LT
T5 = refl

-- Test: Comparing 'z' with 'a' results in GT.
T6 : compare 'z' 'a' ≡ GT
T6 = refl

