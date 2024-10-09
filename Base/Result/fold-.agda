module Base.Result.fold- where

open import Base.Result.fold
open import Base.Result.Result
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Nat.mul
open import Base.Nat.sub

-- Test: Apply 'done' function to the value inside Done constructor.
T0 : fold (λ x → x + 1) (λ e → e - 1) (Done 5) ≡ 6
T0 = refl

-- Test: Apply 'fail' function to the error inside Fail constructor.
T1 : fold (λ x → x + 1) (λ e → e - 1) (Fail 10) ≡ 9
T1 = refl

-- Test: 'done' function applied when Result is Done with a different operation.
T2 : fold (λ x → x * 2) (λ e → e * 3) (Done 4) ≡ 8
T2 = refl

-- Test: 'fail' function applied when Result is Fail with a different operation.
T3 : fold (λ x → x * 2) (λ e → e * 3) (Fail 6) ≡ 18
T3 = refl

-- Test: Check fold for Done with an identity function for 'done'.
T4 : fold (λ x → x) (λ e → e + 2) (Done 100) ≡ 100
T4 = refl

-- Test: Check fold for Fail with an identity function for 'fail'.
T5 : fold (λ x → x * 10) (λ e → e) (Fail 42) ≡ 42
T5 = refl

-- Test: Check fold for Done where both functions are the same.
T6 : fold (λ x → x + 5) (λ e → e + 5) (Done 7) ≡ 12
T6 = refl

-- Test: Check fold for Fail where both functions are the same.
T7 : fold (λ x → x + 5) (λ e → e + 5) (Fail 3) ≡ 8
T7 = refl