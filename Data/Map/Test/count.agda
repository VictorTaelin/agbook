module Data.Map.Test.count where

open import Data.Map.Type
open import Data.Map.count
open import Data.Map.empty
open import Data.Map.set
open import Data.Bits.Type
open import Data.Nat.Type
open import Data.Equal.Type

test-case : ∀ {A : Set} → Map A → Nat → Set
test-case m expected = count m == expected

test-empty : count empty == 0
test-empty = refl

test-set-empty : count (set empty E 1) == 1
test-set-empty = refl

test-set-empty-different-key : count (set empty (O E) 1) == 1
test-set-empty-different-key = refl

test-set-multiple-1 : count (set (set empty (O E) 1) (I E) 2) == 2
test-set-multiple-1 = refl

test-set-multiple-2 : count (set (set empty (O E) 1) (O E) 2) == 1
test-set-multiple-2 = refl

test-set-multiple-3 : count (set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3) == 3
test-set-multiple-3 = refl

test-set-multiple-4 : count (set (set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3) (I (I E)) 4) == 4
test-set-multiple-4 = refl

test-set-multiple-5 : count (set (set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3) (O (I E)) 4) == 3
test-set-multiple-5 = refl
