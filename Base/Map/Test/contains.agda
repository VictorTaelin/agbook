module Base.Map.Test.contains where

open import Base.Map.Type
open import Base.Map.contains
open import Base.Map.empty
open import Base.Map.set
open import Base.Bits.Type
open import Base.Bool.Type
open import Base.Nat.Type
open import Base.Equal.Type

test-case : ∀ {A : Set} → Map A → Bits → Bool → Set
test-case m k expected = contains m k === expected

test-empty : contains empty E === False
test-empty = refl

test-set-empty : contains (set empty E 1) E === True
test-set-empty = refl

test-set-empty-different-key : contains (set empty (O E) 1) E === False
test-set-empty-different-key = refl

test-set-empty-same-key : contains (set empty (O E) 1) (O E) === True
test-set-empty-same-key = refl

test-set-empty-different-key-2 : contains (set empty (I E) 1) (O E) === False
test-set-empty-different-key-2 = refl

test-set-multiple-1 : contains (set (set empty (O E) 1) (I E) 2) (O E) === True
test-set-multiple-1 = refl

test-set-multiple-2 : contains (set (set empty (O E) 1) (I E) 2) (I E) === True
test-set-multiple-2 = refl

test-set-multiple-3 : contains (set (set empty (O E) 1) (I E) 2) (O (O E)) === False
test-set-multiple-3 = refl

test-set-multiple-4 : contains (set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3) (O (I E)) === True
test-set-multiple-4 = refl

test-set-multiple-5 : contains (set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3) (I (I E)) === False
test-set-multiple-5 = refl

