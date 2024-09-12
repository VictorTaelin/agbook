module Data.Bits.Test.normal where

open import Data.Bits.Type
open import Data.Bits.normal
--open import Data.Bits.eq
open import Data.Equal.Type

test-normal-empty : normal E == E
test-normal-empty = refl

test-normal-single-zero : normal (O E) == E
test-normal-single-zero = refl

test-normal-multiple-zeros : normal (O (O (O E))) == E
test-normal-multiple-zeros = refl

test-normal-zeros-then-one : (normal (O (O (I E)))) == I E
test-normal-zeros-then-one = refl

test-normal-no-leading-zeros : normal (I (O (I E))) == I (O (I E))
test-normal-no-leading-zeros = refl

test-normal-complex : normal (O (O (I (O (I (O E)))))) == I (O (I (O E)))
test-normal-complex = refl


