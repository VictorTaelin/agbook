module Data.Map.Test.merge where

open import Data.Map.Type
open import Data.Map.empty
open import Data.Map.set
open import Data.Map.get
open import Data.Map.merge
open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Equal.Type
open import Data.Nat.Type
open import Data.String.Type

test-merge-empty : merge empty empty === empty {Nat}
test-merge-empty = refl

test-merge-empty-nonempty : 
  let m = set empty (O E) 1
  in merge empty m === m
test-merge-empty-nonempty = refl

test-merge-nonempty-empty : 
  let m = set empty (I E) 2
  in merge m empty === m
test-merge-nonempty-empty = refl

test-merge-no-conflicts : 
  let m1 = set (set empty (O E) 1) (I E) 2
      m2 = set empty (O (O E)) 3
      result = set (set (set empty (O E) 1) (I E) 2) (O (O E)) 3
  in merge m1 m2 === result
test-merge-no-conflicts = refl

test-merge-with-conflicts : 
  let m1 = set (set empty (O E) 1) (I E) 2
      m2 = set empty (O E) 10
      result = set (set empty (O E) 10) (I E) 2
  in merge m1 m2 === result
test-merge-with-conflicts = refl

test-merge-different-types : 
  let m1 = set empty (O E) "hello"
      m2 = set empty (I E) "world"
      result = set (set empty (O E) "hello") (I E) "world"
  in merge m1 m2 === result
test-merge-different-types = refl

