module Data.Bits.Test.or where

open import Data.Bits.Type
open import Data.Bits.or
open import Data.Equal.Type

test-empty : E || E == E
test-empty = refl

test-empty-right : E || (I E) == I E
test-empty-right = refl

test-empty-left : (O E) || E == O E
test-empty-left = refl

test-single-bit-1 : (O E) || (O E) == O E
test-single-bit-1 = refl

test-single-bit-2 : (O E) || (I E) == I E
test-single-bit-2 = refl

test-single-bit-3 : (I E) || (O E) == I E
test-single-bit-3 = refl

test-single-bit-4 : (I E) || (I E) == I E
test-single-bit-4 = refl

test-multi-bit-1 : (O (I E)) || (I (O E)) == I (I E)
test-multi-bit-1 = refl

test-multi-bit-2 : (I (O (I E))) || (O (I (O E))) == I (I (I E))
test-multi-bit-2 = refl

test-multi-bit-3 : (O (O (I E))) || (I (I (O E))) == I (I (I E))
test-multi-bit-3 = refl
