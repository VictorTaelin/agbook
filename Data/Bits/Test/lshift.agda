module Data.Bits.Test.lshift where

open import Data.Bits.Type
open import Data.Bits.lshift
open import Data.Bits.from-nat
open import Data.Nat.Type
open import Data.Equal.Type

test-lshift-zero : (E << 3) === E
test-lshift-zero = refl

test-lshift-one : ((I E) << 1) === (O (I E))
test-lshift-one = refl

test-lshift-five : ((I (O (I E))) << 2) === (O (O (I (O (I E)))))
test-lshift-five = refl

test-lshift-three : ((I (I E)) << 3) === (O (O (O (I (I E)))))
test-lshift-three = refl

test-lshift-zero-shift : ((I (O (I E))) << 0) === (I (O (I E)))
test-lshift-zero-shift = refl

test-from-nat-lshift : (from-nat 7 << 2) === from-nat 28
test-from-nat-lshift = refl

test-lshift-infix : (from-nat 9 << 1) === from-nat 18
test-lshift-infix = refl
