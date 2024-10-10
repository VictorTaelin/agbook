module Base.Bits.add- where

open import Base.Bits.Bits
open import Base.Bits.add
open import Base.Equal.Equal

test-add-zero-zero : (O E) + (O E) ≡ (O E)
test-add-zero-zero = refl

test-add-one-zero : (I E) + (O E) ≡ (I E)
test-add-one-zero = refl

test-add-zero-one : (O E) + (I E) ≡ (I E)
test-add-zero-one = refl

test-add-one-one : (I E) + (I E) ≡ (O (I E))
test-add-one-one = refl

test-add-two-one : (O (I E)) + (I (O E)) ≡ (I (I E))
test-add-two-one = refl

test-add-three-one : (I (I E)) + (I (O E)) ≡ (O (O (I E)))
test-add-three-one = refl

test-add-five-three : (I (O (I E))) + (I (I (O E))) ≡ (O (O (O (I E))))
test-add-five-three = refl

test-add-empty-empty : E + E ≡ E
test-add-empty-empty = refl

test-add-nonempty-empty : (I (O (I E))) + E ≡ (I (O (I E)))
test-add-nonempty-empty = refl

test-add-empty-nonempty : E + (I (O (I E))) ≡ (I (O (I E)))
test-add-empty-nonempty = refl

