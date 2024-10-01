module Base.Nat.lt- where

open import Base.Nat.Nat
open import Base.Nat.lt
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: 0 < 0 = False
test-lt-zero-zero : (0 < 0) ≡ False
test-lt-zero-zero = refl

-- Test: 0 < 1 = True
test-lt-zero-one : (0 < 1) ≡ True
test-lt-zero-one = refl

-- Test: 1 < 0 = False
test-lt-one-zero : (1 < 0) ≡ False
test-lt-one-zero = refl

-- Test: 2 < 5 = True
test-lt-two-five : (2 < 5) ≡ True
test-lt-two-five = refl

-- Test: 5 < 2 = False
test-lt-five-two : (5 < 2) ≡ False
test-lt-five-two = refl

-- Test: 7 < 7 = False
test-lt-seven-seven : (7 < 7) ≡ False
test-lt-seven-seven = refl

-- Test: Transitivity: if a < b and b < c, then a < c
test-lt-transitive : (3 < 5) ≡ True → (5 < 8) ≡ True → (3 < 8) ≡ True
test-lt-transitive refl refl = refl

-- Test: Irreflexivity: a < a = False
test-lt-irreflexive : (4 < 4) ≡ False
test-lt-irreflexive = refl
