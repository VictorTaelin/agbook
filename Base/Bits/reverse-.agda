module Base.Bits.reverse- where

open import Base.Bits.Bits
open import Base.Bits.reverse
open import Base.Equal.Equal

test-reverse-empty : reverse E ≡ E
test-reverse-empty = refl

test-reverse-zero : reverse (O E) ≡ O E
test-reverse-zero = refl

test-reverse-one : reverse (I E) ≡ I E
test-reverse-one = refl

test-reverse-two-bits : reverse (O (I E)) ≡ I (O E)
test-reverse-two-bits = refl

test-reverse-three-bits : reverse (I (O (I E))) ≡ I (O (I E))
test-reverse-three-bits = refl

test-reverse-longer : reverse (I (O (O (I (O (I (I E))))))) ≡ I (I (O (I (O (O (I E))))))
test-reverse-longer = refl

test-double-reverse : reverse (reverse (I (O (I E)))) ≡ I (O (I E))
test-double-reverse = refl
