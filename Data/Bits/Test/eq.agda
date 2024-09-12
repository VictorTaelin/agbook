module Data.Bits.Test.eq where

open import Data.Bits.Type
open import Data.Bits.eq renaming (_==_ to _b==_)
open import Data.Equal.Type
open import Data.Bool.Type

test-eq-empty-empty : (E b== E) == True
test-eq-empty-empty = refl

test-eq-zero-zero : (O E b== O E) == True
test-eq-zero-zero = refl

test-eq-one-one : (I E b== I E) == True
test-eq-one-one = refl

test-eq-zero-one : (O E b== I E) == False
test-eq-zero-one = refl

test-eq-one-zero : (I E b== O E) == False
test-eq-one-zero = refl

test-eq-101-101 : (I (O (I E)) b== I (O (I E))) == True
test-eq-101-101 = refl

test-eq-110-101 : (I (I (O E)) b== I (O (I E))) == False
test-eq-110-101 = refl

test-eq-1010-1010 : (O (I (O (I E))) b== O (I (O (I E)))) == True
test-eq-1010-1010 = refl

test-eq-1010-1011 : (O (I (O (I E))) b== I (I (O (I E)))) == False
test-eq-1010-1011 = refl

test-eq-10-100 : (O (I E) b== O (O (I E))) == False
test-eq-10-100 = refl

test-eq-100-10 : (O (O (I E)) b== O (I E)) == False
test-eq-100-10 = refl

