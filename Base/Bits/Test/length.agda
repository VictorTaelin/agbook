module Base.Bits.Test.length where

open import Base.Bits.Type
open import Base.Bits.length
open import Base.Nat.Type
open import Base.Equal.Type

test-empty : length E === 0
test-empty = refl

test-single-bit-zero : length (O E) === 1
test-single-bit-zero = refl

test-single-bit-one : length (I E) === 1
test-single-bit-one = refl

test-two-bits : length (O (I E)) === 2
test-two-bits = refl

test-three-bits : length (I (O (I E))) === 3
test-three-bits = refl

test-four-bits : length (O (O (I (I E)))) === 4
test-four-bits = refl