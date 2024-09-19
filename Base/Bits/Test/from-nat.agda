module Base.Bits.Test.from-nat where

open import Base.Bits.Type
open import Base.Bits.from-nat
open import Base.Nat.Type
open import Base.Equal.Type

test-from-nat-zero : from-nat 0 === E
test-from-nat-zero = refl

test-from-nat-one : from-nat 1 === I E
test-from-nat-one = refl

test-from-nat-two : from-nat 2 === O (I E)
test-from-nat-two = refl

test-from-nat-three : from-nat 3 === I (I E)
test-from-nat-three = refl

test-from-nat-four : from-nat 4 === O (O (I E))
test-from-nat-four = refl

test-from-nat-five : from-nat 5 === I (O (I E))
test-from-nat-five = refl

test-from-nat-ten : from-nat 10 === O (I (O (I E)))
test-from-nat-ten = refl

test-from-nat-fifteen : from-nat 15 === I (I (I (I E)))
test-from-nat-fifteen = refl

test-from-nat-sixteen : from-nat 16 === O (O (O (O (I E))))
test-from-nat-sixteen = refl

test-from-nat-thirty-one : from-nat 31 === I (I (I (I (I E))))
test-from-nat-thirty-one = refl
