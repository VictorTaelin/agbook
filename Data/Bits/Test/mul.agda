module Data.Bits.Test.mul where

open import Data.Bits.Type
open import Data.Bits.mul
open import Data.Bits.from-nat
open import Data.Bits.to-nat
open import Data.Nat.Type
open import Data.Equal.Type

test-mul-zero : (I (I E)) * E === E
test-mul-zero = refl

test-mul-one : (I (O (I E))) * (I E) === (I (O (I E)))
test-mul-one = refl

test-mul-non-trivial : (I (O (I E))) * (I (I E)) === (I (I (I (I E))))
test-mul-non-trivial = refl

test-mul-nat-conversion : to-nat ((from-nat 3) * (from-nat 2)) === 6
test-mul-nat-conversion = refl

