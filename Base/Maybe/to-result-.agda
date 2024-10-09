module Base.Maybe.to-result- where

open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Maybe.Maybe
open import Base.Maybe.to-result
open import Base.Result.Result
open import Base.Nat.Nat
open import Base.String.String

-- Test cases
test-to-result-some : to-result (Some 42) "error" ≡ Done 42
test-to-result-some = refl

test-to-result-none : to-result {Nat} {String} None "Not found" ≡ Fail "Not found"
test-to-result-none = refl

test-to-result-some-bool : to-result (Some True) 0 ≡ Done True
test-to-result-some-bool = refl

-- Property: to-result preserves the value in Some
to-result-preserves-some : ∀ {A B : Set} → (x : A) → (y : B) → to-result (Some x) y ≡ Done x
to-result-preserves-some x y = refl

-- Property: to-result with None always returns Fail with the provided error value
to-result-none-fail : ∀ {A B : Set} → (y : B) → to-result {A} {B} None y ≡ Fail y
to-result-none-fail y = refl

-- Property: to-result is independent of the error value when given Some
to-result-some-independent-of-error : ∀ {A B : Set} → (x : A) → (y1 y2 : B) → 
                                      to-result (Some x) y1 ≡ to-result (Some x) y2
to-result-some-independent-of-error x y1 y2 = refl
