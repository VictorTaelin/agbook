module Data.Bits.Test.append where

open import Data.Bits.Type
open import Data.Bits.append
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type
open import Data.Equal.Type

test-append-empty-empty : E ++ E === E
test-append-empty-empty = refl

test-append-empty-right : (O (I E)) ++ E === O (I E)
test-append-empty-right = refl

test-append-empty-left : E ++ (I (O E)) === I (O E)
test-append-empty-left = refl

test-append-single-bits : (O E) ++ (I E) === O (I E)
test-append-single-bits = refl

test-append-longer : (I (O E)) ++ (O (I E)) === I (O (O (I E)))
test-append-longer = refl

test-append-zeros : (O (O E)) ++ (O (O E)) === O (O (O (O E)))
test-append-zeros = refl

test-append-ones : (I (I E)) ++ (I (I E)) === I (I (I (I E)))
test-append-ones = refl

test-append-associative : ((O E) ++ (I E)) ++ (O E) === (O E) ++ ((I E) ++ (O E))
test-append-associative = refl

test-append-mixed : (I (O (I E))) ++ (O (I (O E))) === I (O (I (O (I (O E)))))
test-append-mixed = refl
