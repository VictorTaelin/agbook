module Data.Pair.Test.eq where

open import Data.Pair.Type
open import Data.Pair.eq
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Char.Type
open import Data.Char.eq
open import Data.Equal.Type

test-eq-same-pair : ((1 , True) == (1 , True)) === True
test-eq-same-pair = refl

test-eq-different-first : ((1 , True) == (2 , True)) === False
test-eq-different-first = refl

test-neq-different-second : ((1 , True) != (1 , False)) === True
test-neq-different-second = refl

test-eq-char-pair-same : ((1 , 'a') == (1 , 'a')) === True
test-eq-char-pair-same = refl

test-eq-char-pair-different : ((1 , 'a') == (2 , 'a')) === False
test-eq-char-pair-different = refl