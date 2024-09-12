module Data.Bits.Test.sub where

open import Data.Bits.Type
open import Data.Bits.sub
open import Data.Bits.from-nat
open import Data.Bits.to-nat
--open import Data.Bits.eq
open import Data.Equal.Type

test-sub-zero-zero : (E - E) == E
test-sub-zero-zero = refl

test-sub-one-zero : ((I E) - E) == (I E)
test-sub-one-zero = refl

test-sub-one-one : ((I E) - (I E)) == (O E)
test-sub-one-one = refl

test-sub-ten-one : ((O (I E)) - (I E)) == (I (O E))
test-sub-ten-one = refl

test-sub-fifteen-seven : ((I (I (I (I E)))) - (I (I (I E)))) == (O (O (O (I E))))
test-sub-fifteen-seven = refl

