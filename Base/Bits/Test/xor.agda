module Base.Bits.Test.xor where

open import Base.Bits.Type
open import Base.Bits.xor
open import Base.Equal.Type

test-xor-empty : E ^ E === E
test-xor-empty = refl

test-xor-empty-left : E ^ (I (O E)) === I (O E)
test-xor-empty-left = refl

test-xor-empty-right : (O (I E)) ^ E === O (I E)
test-xor-empty-right = refl

test-xor-zero-zero : (O E) ^ (O E) === O E
test-xor-zero-zero = refl

test-xor-zero-one : (O E) ^ (I E) === I E
test-xor-zero-one = refl

test-xor-one-zero : (I E) ^ (O E) === I E
test-xor-one-zero = refl

test-xor-one-one : (I E) ^ (I E) === O E
test-xor-one-one = refl

test-xor-multi : (I (O (I E))) ^ (O (I (O E))) === I (I (I E))
test-xor-multi = refl

test-xor-associative : ((I (O E)) ^ (O (I E))) ^ (I (I E)) === (I (O E)) ^ ((O (I E)) ^ (I (I E)))
test-xor-associative = refl

test-xor-commutative : (I (O (I E))) ^ (O (I (O E))) === (O (I (O E))) ^ (I (O (I E)))
test-xor-commutative = refl

test-xor-self-zero : (I (O (I E))) ^ (I (O (I E))) === O (O (O E))
test-xor-self-zero = refl
