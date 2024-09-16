module Data.List.Test.sort where

open import Data.List.Type
open import Data.List.sort
open import Data.List.eq
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Nat.lt
open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Equal.Type

-- Test sorting an empty list
test-sort-empty : sort _<_ ([] {A = Nat}) === []
test-sort-empty = refl

-- Test sorting a list with one element
test-sort-single : sort _<_ (5 :: []) === (5 :: [])
test-sort-single = refl

-- Test sorting an already sorted list
test-sort-sorted : sort _<_ (1 :: 2 :: 3 :: []) === (1 :: 2 :: 3 :: [])
test-sort-sorted = refl

-- Test sorting a reverse-sorted list
test-sort-reverse : sort _<_ (3 :: 2 :: 1 :: []) === (1 :: 2 :: 3 :: [])
test-sort-reverse = refl

-- Test sorting a list with duplicate elements
test-sort-duplicates : sort _<_ (3 :: 1 :: 3 :: 2 :: 1 :: []) === (1 :: 1 :: 2 :: 3 :: 3 :: [])
test-sort-duplicates = refl
