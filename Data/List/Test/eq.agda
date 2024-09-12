module Data.List.Test.eq where

open import Data.List.Type
open import Data.List.eq
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Equal.Type

test-eq-different-lists : ((1 :: 2 :: 3 :: []) == (1 :: 2 :: 4 :: [])) === False
test-eq-different-lists = refl

test-eq-empty-lists : ([] == ([] {A = Nat})) === True
test-eq-empty-lists = refl

test-eq-identical-lists : ((1 :: 2 :: 3 :: []) == (1 :: 2 :: 3 :: [])) === True
test-eq-identical-lists = refl

test-eq-different-length : ((1 :: 2 :: []) == (1 :: 2 :: 3 :: [])) === False
test-eq-different-length = refl

test-neq-bool-lists : ((True :: False :: []) != (True :: True :: [])) === True
test-neq-bool-lists = refl
