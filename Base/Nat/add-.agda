module Base.Nat.add- where

open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test: 0 + 0 = 0
test-add-zero-zero : (0 + 0) ≡ 0
test-add-zero-zero = refl

-- Test: 0 + 5 = 5
test-add-zero-five : (0 + 5) ≡ 5
test-add-zero-five = refl

-- Test: 5 + 0 = 5
test-add-five-zero : (5 + 0) ≡ 5
test-add-five-zero = refl

-- Test: 3 + 2 = 5
test-add-three-two : (3 + 2) ≡ 5
test-add-three-two = refl

-- Test: 7 + 8 = 15
test-add-seven-eight : (7 + 8) ≡ 15
test-add-seven-eight = refl

-- Test: Commutativity: a + b = b + a
test-add-commutative : (3 + 4) ≡ (4 + 3)
test-add-commutative = refl

-- Test: Associativity: (a + b) + c = a + (b + c)
test-add-associative : ((2 + 3) + 4) ≡ (2 + (3 + 4))
test-add-associative = refl
