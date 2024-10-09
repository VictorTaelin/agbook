module Base.BinMap.Test.from-list where

import Base.Bool.eq as eq 
open import Base.BinMap.BinMap
open import Base.BinMap.from-list
open import Base.BinMap.get
open import Base.Bits.Bits
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Empty.Empty
open import Base.Equal.Equal
open import Base.List.List
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.Unit.Unit

test-empty-map : get (from-list []) E ≡ None
test-empty-map = refl

test-single-element-map : get (from-list ((E , 1) :: [])) E ≡ Some 1
test-single-element-map = refl

test-single-element-map-match : get (from-list ((O E , 2) :: [])) (O E) ≡ Some 2
test-single-element-map-match = refl

test-single-element-map-no-match : get (from-list ((O E , 2) :: [])) (I E) ≡ None
test-single-element-map-no-match = refl

test-two-element-map-first : get (from-list ((O E , 2) :: (I E , 3) :: [])) (O E) ≡ Some 2
test-two-element-map-first = refl

test-two-element-map-second : get (from-list ((O E , 2) :: (I E , 3) :: [])) (I E) ≡ Some 3
test-two-element-map-second = refl

test-two-element-map-no-match : get (from-list ((O E , 2) :: (I E , 3) :: [])) E ≡ None
test-two-element-map-no-match = refl

test-multi-element-map-first : get (from-list ((O (I E) , 4) :: (I (O E) , 5) :: (O (O E) , 6) :: [])) (O (I E)) ≡ Some 4
test-multi-element-map-first = refl

test-multi-element-map-second : get (from-list ((O (I E) , 4) :: (I (O E) , 5) :: (O (O E) , 6) :: [])) (I (O E)) ≡ Some 5
test-multi-element-map-second = refl

test-multi-element-map-third : get (from-list ((O (I E) , 4) :: (I (O E) , 5) :: (O (O E) , 6) :: [])) (O (O E)) ≡ Some 6
test-multi-element-map-third = refl

test-multi-element-map-no-match : get (from-list ((O (I E) , 4) :: (I (O E) , 5) :: (O (O E) , 6) :: [])) (I (I E)) ≡ None
test-multi-element-map-no-match = refl

