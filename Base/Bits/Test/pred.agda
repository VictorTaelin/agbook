module Base.Bits.Test.pred where

open import Base.Bits.Bits
open import Base.Bits.pred
open import Base.Equal.Equal
open import Base.Bool.Bool

test-pred-empty : pred E ≡ E
test-pred-empty = refl

test-pred-zero : pred (O E) ≡ E
test-pred-zero = refl

test-pred-one : pred (I E) ≡ O E
test-pred-one = refl

test-pred-two : pred (O (I E)) ≡ I (O E)
test-pred-two = refl

test-pred-three : pred (I (I E)) ≡ O (I E)
test-pred-three = refl

test-pred-four : pred (O (O (I E))) ≡ I (I (O E))
test-pred-four = refl

test-pred-five : pred (I (O (I E))) ≡ O (O (I E))
test-pred-five = refl
