module Data.Bits.Test.inc where

open import Data.Bits.Type
open import Data.Bits.inc
open import Data.Equal.Type
open import Data.Bool.Type

-- Test incrementing E (empty bitstring)
test-inc-empty : inc E == E
test-inc-empty = refl

-- Test incrementing 0 (O E)
test-inc-zero : inc (O E) == I E
test-inc-zero = refl

test-inc-one : inc (I E) == (O E)
test-inc-one = refl

test-inc-two : inc (O (I E)) == I (I E)
test-inc-two = refl

test-inc-three : inc (I (I E)) == (O (O E))
test-inc-three = refl

test-inc-four : inc (O (O (I E))) == I (O (I E))
test-inc-four = refl

test-inc-seven : inc (I (I (I E))) == (O (O (O  E)))
test-inc-seven = refl

