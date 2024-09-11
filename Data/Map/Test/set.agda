module Data.Map.Test.set where

open import Data.Map.Type
open import Data.Map.set
open import Data.Map.get
open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Equal.Type

test-set-empty-root : get (set Leaf E 1) E == Some 1
test-set-empty-root = refl

test-set-empty-deep : get (set Leaf (O (I E)) 2) (O (I E)) == Some 2
test-set-empty-deep = refl

test-set-multiple-preserve : get (set (set (set Leaf E 1) (I E) 2) (O E) 3) (I E) == Some 2
test-set-multiple-preserve = refl

test-set-overwrite-root : get (set (set Leaf E 1) E 4) E == Some 4
test-set-overwrite-root = refl

test-set-preserve-root : get (set (set Leaf E 1) (I E) 2) E == Some 1
test-set-preserve-root = refl

test-set-get-nonexistent : get (set Leaf E 1) (I E) == None
test-set-get-nonexistent = refl
