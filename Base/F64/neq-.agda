module Base.F64.neq- where

open import Base.F64.F64
open import Base.F64.neq
open import Base.Bool.Bool
open import Base.Equal.Equal

test-neq-same : (3.14 != 3.14) ≡ False
test-neq-same = refl

test-neq-different : (3.14 != 2.71) ≡ True
test-neq-different = refl
