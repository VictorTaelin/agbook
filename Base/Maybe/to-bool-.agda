module Base.Maybe.to-bool- where

open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Maybe.Maybe
open import Base.Maybe.to-bool
open import Base.Nat.Nat

-- Test cases
test-to-bool-none : to-bool {Bool} None ≡ False
test-to-bool-none = refl

test-to-bool-some-nat : to-bool (Some 42) ≡ True
test-to-bool-some-nat = refl

test-to-bool-some-bool : to-bool (Some True) ≡ True
test-to-bool-some-bool = refl

test-to-bool-some-false : to-bool (Some False) ≡ True
test-to-bool-some-false = refl

-- Property: to-bool always returns True for Some, regardless of the contained value
test-to-bool-some-always-true : ∀ {A : Set} → (x : A) → to-bool (Some x) ≡ True
test-to-bool-some-always-true x = refl

-- Property: to-bool always returns False for None, regardless of the type
test-to-bool-none-always-false : ∀ {A : Set} → to-bool {A} None ≡ False
test-to-bool-none-always-false = refl

