module Base.Nat.compare- where

open import Base.Nat.Nat
open import Base.Nat.compare
open import Base.Ordering.Ordering
open import Base.Equal.Equal

-- Test: compare 0 0 = EQ
T0 : compare 0 0 ≡ EQ
T0 = refl

-- Test: compare 0 5 = LT
T1 : compare 0 5 ≡ LT
T1 = refl

-- Test: compare 5 0 = GT
T2 : compare 5 0 ≡ GT
T2 = refl

-- Test: compare 3 3 = EQ
T3 : compare 3 3 ≡ EQ
T3 = refl

-- Test: compare 2 7 = LT
T4 : compare 2 7 ≡ LT
T4 = refl

-- Test: compare 8 4 = GT
T5 : compare 8 4 ≡ GT
T5 = refl

-- Test: Transitivity: if a < b and b < c, then a < c
T6 : (compare 2 5 ≡ LT) → (compare 5 8 ≡ LT) → (compare 2 8 ≡ LT)
T6 refl refl = refl

-- Test: Antisymmetry: if compare a b = EQ, then a = b
T7 : (compare 6 6 ≡ EQ) → 6 ≡ 6
T7 refl = refl

