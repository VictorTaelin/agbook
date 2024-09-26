module Base.Bits.Test.concat where

open import Base.Bits.Bits
open import Base.Bits.concat
open import Base.List.List
open import Base.Equal.Equal

test-concat-empty : concat [] ≡ E
test-concat-empty = refl

test-concat-single-empty : concat (E :: []) ≡ E
test-concat-single-empty = refl

test-concat-single-zero : concat (O E :: []) ≡ O E
test-concat-single-zero = refl

test-concat-single-one : concat (I E :: []) ≡ I E
test-concat-single-one = refl

test-concat-multiple-bits : concat (O E :: I E :: O E :: []) ≡ O (I (O E))
test-concat-multiple-bits = refl

test-concat-nested-bits : concat (O (I E) :: I (O E) :: []) ≡ O (I (I (O E)))
test-concat-nested-bits = refl

test-concat-mixed : concat (O E :: I (O E) :: O (I E) :: []) ≡ O (I (O (O (I E))))
test-concat-mixed = refl

test-concat-all-empty : concat (E :: E :: E :: []) ≡ E
test-concat-all-empty = refl

test-concat-complex : concat (I (O (I E)) :: O (I E) :: I E :: []) ≡ I (O (I (O (I (I E)))))
test-concat-complex = refl
