module Base.Bits.Test.gt where

open import Base.Bits.Bits
open import Base.Bits.gt
open import Base.Bool.Bool
open import Base.Equal.Equal

test-gt-empty-empty : (E > E) ≡ False
test-gt-empty-empty = refl

test-gt-empty-non-empty : (E > (O E)) ≡ False
test-gt-empty-non-empty = refl

test-gt-non-empty-empty : ((O E) > E) ≡ True
test-gt-non-empty-empty = refl

test-gt-one-zero : ((I E) > (O E)) ≡ True
test-gt-one-zero = refl

test-gt-zero-one : ((O E) > (I E)) ≡ False
test-gt-zero-one = refl

test-gt-two-one : ((I (O E)) > (O (I E))) ≡ True
test-gt-two-one = refl

test-gt-one-two : ((O (I E)) > (I (O E))) ≡ False
test-gt-one-two = refl

test-gt-three-two : ((I (I E)) > (I (O E))) ≡ True
test-gt-three-two = refl

test-gt-four-three : ((O (O (I E))) > O (I (I E))) ≡ False
test-gt-four-three = refl

-- This compares up two the min bits, so it compares II and OO, no padding
test-gt-three-four : ((I (I E)) > (O (O (I E)))) ≡ True
test-gt-three-four = refl

test-gt-equal : ((I (O (I E))) > (I (O (I E)))) ≡ False
test-gt-equal = refl

