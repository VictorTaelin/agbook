module Base.Bits.inc- where

open import Base.Bits.Bits
open import Base.Bits.inc
open import Base.Equal.Equal
open import Base.Bool.Bool

test-inc-empty : inc E ≡ I E
test-inc-empty = refl

test-inc-zero : inc (O E) ≡ I E
test-inc-zero = refl

test-inc-one : inc (I E) ≡ (O (I E))
test-inc-one = refl

test-inc-two : inc (O (I E)) ≡ I (I E)
test-inc-two = refl

test-inc-three : inc (I (I E)) ≡ (O (O (I E)))
test-inc-three = refl

test-inc-four : inc (O (O (I E))) ≡ I (O (I E))
test-inc-four = refl

test-inc-seven : inc (I (I (I E))) ≡ (O (O (O (I E))))
test-inc-seven = refl

