module Base.Maybe.some- where

open import Base.Maybe.Maybe
open import Base.Maybe.some
open import Base.Equal.Equal
open import Base.Bool.Bool
open import Base.Nat.Nat 
open import Base.String.String

-- Test cases for the 'some' function

test-some-int : some 42 ≡ Some 42
test-some-int = refl

test-some-bool : some True ≡ Some True
test-some-bool = refl

test-some-string : some "hello" ≡ Some "hello"
test-some-string = refl

-- Test case to ensure 'some' and 'Some' are equivalent
test-some-is-Some : ∀ {a} {A : Set a} → (x : A) → some x ≡ Some x
test-some-is-Some _ = refl
