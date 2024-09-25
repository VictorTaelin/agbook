module Base.Bits.Test.and where

open import Base.Bits.Type
open import Base.Bits.and
open import Base.Bool.if
open import Base.Unit.Type
open import Base.Empty.Type
open import Base.Equal.Type

test-and-empty-empty : (E && E) ≡ E
test-and-empty-empty = refl

test-and-empty-zero : (E && (O E)) ≡ E
test-and-empty-zero = refl

test-and-one-empty : ((I E) && E) ≡ E
test-and-one-empty = refl

test-and-zero-zero : ((O E) && (O E)) ≡ (O E)
test-and-zero-zero = refl

test-and-zero-one : ((O E) && (I E)) ≡ (O E)
test-and-zero-one = refl

test-and-one-zero : ((I E) && (O E)) ≡ (O E)
test-and-one-zero = refl

test-and-one-one : ((I E) && (I E)) ≡ (I E)
test-and-one-one = refl

test-and-complex-1 : ((I (O E)) && (I (I E))) ≡ (I (O E))
test-and-complex-1 = refl

test-and-complex-2 : ((I (O (I E))) && (I (I (O E)))) ≡ (I (O (O E)))
test-and-complex-2 = refl

test-and-complex-3 : ((O (I (O E))) && (I (O (I E)))) ≡ (O (O (O E)))
test-and-complex-3 = refl
