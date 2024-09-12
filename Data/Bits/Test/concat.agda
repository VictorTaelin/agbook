module Data.Bits.Test.concat where

open import Data.Bits.Type
open import Data.Bits.concat
open import Data.List.Type
open import Data.Equal.Type

-- Test concatenating an empty list
test-concat-empty : concat [] == E
test-concat-empty = refl

-- Test concatenating a single empty Bits
test-concat-single-empty : concat (E :: []) == E
test-concat-single-empty = refl

-- Test concatenating a single non-empty Bits
test-concat-single-zero : concat ((O E) :: []) == O E
test-concat-single-zero = refl

test-concat-single-one : concat ((I E) :: []) == I E
test-concat-single-one = refl

-- Test concatenating multiple Bits
test-concat-multiple-1 : concat ((O E) :: (I E) :: []) == I (O E)
test-concat-multiple-1 = refl

test-concat-multiple-2 : concat ((I E) :: (O E) :: (I E) :: []) == I (O (I E))
test-concat-multiple-2 = refl

-- Test concatenating nested Bits
test-concat-nested-1 : concat ((O (I E)) :: (I E) :: []) == I (O (I E))
test-concat-nested-1 = refl

test-concat-nested-2 : concat ((I (O E)) :: (O (I E)) :: []) == I (O (O (I E)))
test-concat-nested-2 = refl

-- Test concatenating with empty Bits in between
test-concat-with-empty : concat ((O E) :: E :: (I E) :: []) == I (O E)
test-concat-with-empty = refl

-- Main function to run all tests (placeholder)
main : _
main = _