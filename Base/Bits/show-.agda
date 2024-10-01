module Base.Bits.show- where

open import Base.Bits.Bits
open import Base.Bits.show
open import Base.String.String
open import Base.Equal.Equal

test-empty : show E ≡ "e"
test-empty = refl

test-zero : show (O E) ≡ "0e"
test-zero = refl

test-one : show (I E) ≡ "1e"
test-one = refl

test-two : show (O (I E)) ≡ "01e"
test-two = refl

test-three : show (I (I E)) ≡ "11e"
test-three = refl

test-four : show (O (O (I E))) ≡ "001e"
test-four = refl

test-five : show (I (O (I E))) ≡ "101e"
test-five = refl

test-complex : show (I (O (I (I (O (O (I E))))))) ≡ "1011001e"
test-complex = refl
