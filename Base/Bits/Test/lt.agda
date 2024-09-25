module Base.Bits.Test.lt where

open import Base.Bits.Type
open import Base.Bits.lt
open import Base.Bits.from-nat
open import Base.Equal.Type
open import Base.Bool.Type

test-empty-not-lt : (E < E) ≡ False
test-empty-not-lt = refl

test-empty-lt-non-empty : (E < O E) ≡ True
test-empty-lt-non-empty = refl

test-non-empty-not-lt-empty : (O E < E) ≡ False
test-non-empty-not-lt-empty = refl

test-zero-lt-one : (O E < I E) ≡ True
test-zero-lt-one = refl

test-one-not-lt-zero : (I E < O E) ≡ False
test-one-not-lt-zero = refl

-- False because it checks up to the shortest str
test-one-lt-two : (I E < O (I E)) ≡ False
test-one-lt-two = refl

test-two-lt-three : (O (I E) < I (I E)) ≡ True
test-two-lt-three = refl

test-three-not-lt-three : (I (I E) < I (I E)) ≡ False
test-three-not-lt-three = refl

-- checks up to shortest
test-four-not-lt-three : (O (O (I E)) < I (I E)) ≡ True
test-four-not-lt-three = refl

test-five-lt-seven : (from-nat 5 < from-nat 7) ≡ True
test-five-lt-seven = refl

test-eight-not-lt-eight : (from-nat 8 < from-nat 8) ≡ False
test-eight-not-lt-eight = refl

