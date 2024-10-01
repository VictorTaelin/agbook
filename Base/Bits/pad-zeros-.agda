module Base.Bits.pad-zeros- where

open import Base.Bits.Bits
open import Base.Bits.pad-zeros
open import Base.Nat.Nat
open import Base.Equal.Equal

test-pad-zeros-empty-0 : pad-zeros 0 E ≡ E
test-pad-zeros-empty-0 = refl

test-pad-zeros-empty-3 : pad-zeros 3 E ≡ O (O (O E))
test-pad-zeros-empty-3 = refl

test-pad-zeros-one-0 : pad-zeros 0 (I E) ≡ I E
test-pad-zeros-one-0 = refl

test-pad-zeros-one-3 : pad-zeros 3 (I E) ≡ I (O (O E))
test-pad-zeros-one-3 = refl

test-pad-zeros-101-2 : pad-zeros 2 (I (O (I E))) ≡ I (O (I E))
test-pad-zeros-101-2 = refl

test-pad-zeros-101-5 : pad-zeros 5 (I (O (I E))) ≡ I (O (I (O (O E))))
test-pad-zeros-101-5 = refl

test-pad-zeros-no-change : pad-zeros 2 (I (I (I E))) ≡ I (I (I E))
test-pad-zeros-no-change = refl
