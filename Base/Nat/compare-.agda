module Base.Nat.compare- where

open import Base.Nat.Nat
open import Base.Nat.compare
open import Base.Ordering.Ordering
open import Base.Equal.Equal

-- Test: compare 0 0 = EQ
test-compare-zero-zero : compare 0 0 ≡ EQ
test-compare-zero-zero = refl

-- Test: compare 0 5 = LT
test-compare-zero-five : compare 0 5 ≡ LT
test-compare-zero-five = refl

-- Test: compare 5 0 = GT
test-compare-five-zero : compare 5 0 ≡ GT
test-compare-five-zero = refl

-- Test: compare 3 3 = EQ
test-compare-three-three : compare 3 3 ≡ EQ
test-compare-three-three = refl

-- Test: compare 2 7 = LT
test-compare-two-seven : compare 2 7 ≡ LT
test-compare-two-seven = refl

-- Test: compare 8 4 = GT
test-compare-eight-four : compare 8 4 ≡ GT
test-compare-eight-four = refl

-- Test: Transitivity: if a < b and b < c, then a < c
test-compare-transitive : (compare 2 5 ≡ LT) → (compare 5 8 ≡ LT) → (compare 2 8 ≡ LT)
test-compare-transitive refl refl = refl

-- Test: Antisymmetry: if compare a b = EQ, then a = b
test-compare-antisymmetric : (compare 6 6 ≡ EQ) → 6 ≡ 6
test-compare-antisymmetric refl = refl
