module Base.Result.Monad.bind- where

open import Base.Result.Result
open import Base.Result.Monad.bind
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.mul
open import Base.String.String

-- Test: Applying bind to a failed Result returns the same Fail.
T0 : bind (Fail "Error") (λ x → Done (x + 5)) ≡ Fail "Error"
T0 = refl

-- Test: Applying a function to a failure should return the same Fail value.
T1 : bind (Fail 10) (λ x → Done (x + 1)) ≡ Fail 10
T1 = refl

-- Test: Chain binds where the first result is a Fail.
T2 : bind (Fail 7) (λ x → bind (Done (x + 2)) (λ y → Done (y * 2))) ≡ Fail 7
T2 = refl

-- Test: Chain binds where the second result is a Fail.
T3 : bind (Done 3) (λ x → bind (Fail 8) (λ y → Done (y * 2))) ≡ Fail 8
T3 = refl