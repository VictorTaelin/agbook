module Base.Maybe.to-list- where

open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Maybe.Maybe
open import Base.Maybe.to-list
open import Base.List.List
open import Base.Nat.Nat

-- Test cases
test-to-list-none : to-list {Nat} None ≡ []
test-to-list-none = refl

test-to-list-some-nat : to-list (Some 42) ≡ 42 :: []
test-to-list-some-nat = refl

test-to-list-some-bool : to-list (Some True) ≡ True :: []
test-to-list-some-bool = refl

-- Property: to-list always returns a list of length 0 or 1
to-list-length : ∀ {A : Set} → (ma : Maybe A) → 
                 (to-list ma ≡ []) ∨ (∃ λ x → to-list ma ≡ x :: [])
to-list-length None = inj₁ refl
to-list-length (Some x) = inj₂ (x , refl)

-- Property: to-list preserves the value in Some
to-list-preserves-some : ∀ {A : Set} → (x : A) → to-list (Some x) ≡ x :: []
to-list-preserves-some x = refl

-- Property: to-list of None is always an empty list
to-list-none-empty : ∀ {A : Set} → to-list {A} None ≡ []
to-list-none-empty = refl

