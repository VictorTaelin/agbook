module Base.Either.Either- where

open import Base.Either.Either
open import Base.Nat.Nat
open import Base.Equal.Equal
open import Base.String.String
open import Base.Bool.Bool

-- Test 1: Construct a Left value
test-left : Either Nat String
test-left = Lft 42

-- Test 2: Construct a Right value
test-right : Either Nat String
test-right = Rgt "Hello"

-- Test 3: Equality check for Left
test-left-eq : test-left ≡ Lft 42
test-left-eq = refl

-- Test 4: Equality check for Right
test-right-eq : test-right ≡ Rgt "Hello"
test-right-eq = refl

-- Test 5: Function that uses Either
is-left : ∀ {A B : Set} → Either A B → Bool
is-left (Lft _) = True
is-left (Rgt _) = False

-- Test 6: Applying is-left function
test-is-left-true : is-left test-left ≡ True
test-is-left-true = refl

test-is-left-false : is-left test-right ≡ False
test-is-left-false = refl

