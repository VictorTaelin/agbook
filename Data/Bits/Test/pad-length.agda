module Data.Bits.Test.pad-length where

open import Data.Bits.Type
open import Data.Bits.pad-length
open import Data.Bits.length
open import Data.Bits.from-nat
open import Data.Pair.Type
open import Data.Pair.fst
open import Data.Pair.snd
open import Data.Equal.Type
open import Data.Nat.Type

test-pad-empty : pad-length E E == (E , E)
test-pad-empty = refl

test-pad-single-empty : pad-length (I E) E == (I E , O E)
test-pad-single-empty = refl

test-pad-single-single : pad-length (O E) (I E) == (O E , I E)
test-pad-single-single = refl

test-pad-longer-left : pad-length (I (I (O E))) (O E) == (I (I (O E)) , O (O (O E)))
test-pad-longer-left = refl

test-pad-longer-right : pad-length (O E) (I (O (I E))) == (O (O (O E)) , I (O (I E)))
test-pad-longer-right = refl
