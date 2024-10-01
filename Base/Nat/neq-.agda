module Base.Nat.neq- where

open import Base.Nat.Nat
open import Base.Nat.neq
open import Base.Bool.Bool
open import Base.Equal.Equal

-- Test cases for neq function

-- Test case 1: Different numbers should return True
test-neq-diff : (0 != 1) ≡ True
test-neq-diff = refl

-- Test case 2: Same numbers should return False
test-neq-same : (2 != 2) ≡ False
test-neq-same = refl

-- Test case 3: Zero and a non-zero number should return True
test-neq-zero-nonzero : (0 != 3) ≡ True
test-neq-zero-nonzero = refl

-- Test case 4: Different non-zero numbers should return True
test-neq-diff-nonzero : (4 != 5) ≡ True
test-neq-diff-nonzero = refl

-- Test case 5: Zero and itself should return False
test-neq-zero-zero : (0 != 0) ≡ False
test-neq-zero-zero = refl

-- Test case 6: Larger numbers should work correctly
test-neq-larger : (10 != 11) ≡ True
test-neq-larger = refl

-- Test case 7: Larger same numbers should return False
test-neq-larger-same : (100 != 100) ≡ False
test-neq-larger-same = refl
