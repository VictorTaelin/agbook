module Base.Bits.Test.normal where

open import Base.Bits.Bits
open import Base.Bits.normal
open import Base.Equal.Equal

test-normal-empty : normal E ≡ E
test-normal-empty = refl

test-normal-single-zero : normal (O E) ≡ E
test-normal-single-zero = refl

test-normal-multiple-zeros : normal (O (O (O E))) ≡ E
test-normal-multiple-zeros = refl

test-normal-zeros-then-one : (normal (I (O (O E)))) ≡ I E
test-normal-zeros-then-one = refl

test-normal-no-leading-zeros : normal (I (O (I E))) ≡ I (O (I E))
test-normal-no-leading-zeros = refl



