module Base.F64.eq- where

open import Base.F64.F64
open import Base.F64.eq
open import Base.F64.add
open import Base.F64.lt
open import Base.F64.sub
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Equal.Equal

equal : F64 → F64 → Bool
equal x y = primFloatLess (primFloatMinus x y) 0.000001 
         && primFloatLess (primFloatMinus y x) 0.000001

test-eq-zero : (0.0 == -0.0) ≡ True
test-eq-zero = refl

test-eq-pi : (3.14 == 3.14) ≡ True
test-eq-pi = refl

test-eq-sum : ((1.1 + 2.2) == 3.3) ≡ False
test-eq-sum = refl

test-eq-sum-approx : (equal (1.1 + 2.2) 3.3) ≡ True
test-eq-sum-approx = refl

test-eq-different : (3.14 == 2.71) ≡ False
test-eq-different = refl

test-neq-same : (3.14 != 3.14) ≡ False
test-neq-same = refl

test-neq-different : (3.14 != 2.71) ≡ True
test-neq-different = refl
