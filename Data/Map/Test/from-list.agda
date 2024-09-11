module Data.Map.Test.from-list where

open import Data.Map.Type
open import Data.Map.from-list
open import Data.Map.get
open import Data.List.Type
open import Data.Pair.Type
open import Data.Bits.Type
open import Data.Nat.Type
open import Data.Maybe.Type
open import Data.Equal.Type
open import Data.Bool.Type
open import Data.Bool.eq renaming (_==_ to _b==_)
open import Data.Bool.if
open import Data.Unit.Type
open import Data.Empty.Type

test-empty-map : get (from-list []) E == None
test-empty-map = refl

test-single-element-map : get (from-list ((E , 1) :: [])) E == Some 1
test-single-element-map = refl

test-single-element-map-match : get (from-list ((O E , 2) :: [])) (O E) == Some 2
test-single-element-map-match = refl

test-single-element-map-no-match : get (from-list ((O E , 2) :: [])) (I E) == None
test-single-element-map-no-match = refl

test-two-element-map-first : get (from-list ((O E , 2) :: (I E , 3) :: [])) (O E) == Some 2
test-two-element-map-first = refl

test-two-element-map-second : get (from-list ((O E , 2) :: (I E , 3) :: [])) (I E) == Some 3
test-two-element-map-second = refl

test-two-element-map-no-match : get (from-list ((O E , 2) :: (I E , 3) :: [])) E == None
test-two-element-map-no-match = refl

test-multi-element-map-first : get (from-list ((O (I E) , 4) :: (I (O E) , 5) :: (O (O E) , 6) :: [])) (O (I E)) == Some 4
test-multi-element-map-first = refl

test-multi-element-map-second : get (from-list ((O (I E) , 4) :: (I (O E) , 5) :: (O (O E) , 6) :: [])) (I (O E)) == Some 5
test-multi-element-map-second = refl

test-multi-element-map-third : get (from-list ((O (I E) , 4) :: (I (O E) , 5) :: (O (O E) , 6) :: [])) (O (O E)) == Some 6
test-multi-element-map-third = refl

test-multi-element-map-no-match : get (from-list ((O (I E) , 4) :: (I (O E) , 5) :: (O (O E) , 6) :: [])) (I (I E)) == None
test-multi-element-map-no-match = refl
