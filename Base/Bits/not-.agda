module Base.Bits.not- where

open import Base.Bits.Bits
open import Base.Bits.not
open import Base.Equal.Equal

test-not-empty : not E ≡ E
test-not-empty = refl

test-not-zero : not (O E) ≡ I E
test-not-zero = refl

test-not-one : not (I E) ≡ O E
test-not-one = refl

test-not-multiple : not (O (I (O E))) ≡ I (O (I E))
test-not-multiple = refl

test-not-double : not (not (I (O (I E)))) ≡ I (O (I E))
test-not-double = refl

test-prefix-not : ~ (O (I E)) ≡ I (O E)
test-prefix-not = refl

