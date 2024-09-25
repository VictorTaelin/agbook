module Base.Bits.Test.to-nat where

open import Base.Bits.Type
open import Base.Bits.to-nat
open import Base.Nat.Type
open import Base.Equal.Type

test-empty : to-nat E ≡ 0
test-empty = refl

test-zero : to-nat (O E) ≡ 0
test-zero = refl

test-one : to-nat (I E) ≡ 1
test-one = refl

test-two : to-nat (O (I E)) ≡ 2
test-two = refl

test-three : to-nat (I (I E)) ≡ 3
test-three = refl

test-four : to-nat (O (O (I E))) ≡ 4
test-four = refl

test-five : to-nat (I (O (I E))) ≡ 5
test-five = refl

test-ten : to-nat (O (I (O (I E)))) ≡ 10
test-ten = refl

test-twenty-five : to-nat (I (O (O (I (I E))))) ≡ 25
test-twenty-five = refl
