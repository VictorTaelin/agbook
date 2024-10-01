module Base.Bits.dec- where

open import Base.Bits.Bits
open import Base.Bits.dec
open import Base.Equal.Equal

test-dec-zero : dec (O E) ≡ (I E)
test-dec-zero = refl

test-dec-one : dec (I E) ≡ (O E)
test-dec-one = refl

test-dec-two : dec (O (I E)) ≡ (I (O E))
test-dec-two = refl

test-dec-three : dec (I (I E)) ≡ (O (I E))
test-dec-three = refl

test-dec-four : dec (O (O (I E))) ≡ (I (I (O E)))
test-dec-four = refl

test-dec-five : dec (I (O (I E))) ≡ (O (O (I E)))
test-dec-five = refl

test-dec-empty : dec E ≡ E
test-dec-empty = refl

test-dec-long : dec (I (O (I (I (O E))))) ≡ (O (O (I (I (O E)))))
test-dec-long = refl

test-dec-all-ones : dec (I (I (I (I E)))) ≡ (O (I (I (I E))))
test-dec-all-ones = refl

test-dec-all-zeros : dec (O (O (O (O E)))) ≡ (I (I (I (I E))))
test-dec-all-zeros = refl
