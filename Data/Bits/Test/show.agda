module Data.Bits.Test.show where

open import Data.Bits.Type
open import Data.Bits.show
open import Data.String.Type
open import Data.Equal.Type

test-empty : show E === "e"
test-empty = refl

test-zero : show (O E) === "0e"
test-zero = refl

test-one : show (I E) === "1e"
test-one = refl

test-two : show (O (I E)) === "01e"
test-two = refl

test-three : show (I (I E)) === "11e"
test-three = refl

test-four : show (O (O (I E))) === "001e"
test-four = refl

test-five : show (I (O (I E))) === "101e"
test-five = refl

test-complex : show (I (O (I (I (O (O (I E))))))) === "1011001e"
test-complex = refl
