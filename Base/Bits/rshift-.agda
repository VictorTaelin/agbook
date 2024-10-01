module Base.Bits.rshift- where

open import Base.Bits.Bits
open import Base.Bits.rshift
open import Base.Bits.from-nat
open import Base.Nat.Nat
open import Base.Equal.Equal

test-rshift-one-by-one : (I E >> 1) ≡ E
test-rshift-one-by-one = refl

test-rshift-two-by-one : (O (I E) >> 1) ≡ I E
test-rshift-two-by-one = refl

test-rshift-seven-by-two : (I (I (I E)) >> 2) ≡ I E
test-rshift-seven-by-two = refl

test-rshift-eight-by-three : (O (O (O (I E))) >> 3) ≡ I E
test-rshift-eight-by-three = refl

test-rshift-fifteen-by-four : (I (I (I (I E))) >> 4) ≡ E
test-rshift-fifteen-by-four = refl

test-rshift-by-zero : (bits : Bits) → (bits >> 0) ≡ bits
test-rshift-by-zero bits = refl

test-rshift-from-nat : (from-nat 42 >> 2) ≡ from-nat 10
test-rshift-from-nat = refl
