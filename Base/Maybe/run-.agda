module Base.Maybe.run- where

open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Maybe.Maybe
open import Base.Maybe.run
open import Base.Nat.Nat

-- Test cases
test-run-none : run 42 None ≡ 42
test-run-none = refl

test-run-some : run 42 (Some 7) ≡ 7
test-run-some = refl

test-run-none-bool : run False None ≡ False
test-run-none-bool = refl

test-run-some-bool : run False (Some True) ≡ True
test-run-some-bool = refl

-- Property: running with the value inside Some should return that value
test-run-some-id : {A : Set} -> (x : A) -> run x (Some x) ≡ x
test-run-some-id x = refl

-- Property: running None with any default should return that default
test-run-none-id : {A : Set} -> (d : A) -> run d None ≡ d
test-run-none-id d = refl

