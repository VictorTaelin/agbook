module Base.BitMap.Test.count where

open import Base.BitMap.Type
open import Base.BitMap.count
open import Base.BitMap.empty
open import Base.BitMap.set
open import Base.Bits.Type
open import Base.Equal.Type
open import Base.Nat.Type

test-case : ∀ {A : Set} -> BitMap A -> Nat -> Set
test-case m expected = count m === expected

test-empty : count empty === 0
test-empty = refl

test-set-empty : count (set empty E 1) === 1
test-set-empty = refl

test-set-empty-different-key : count (set empty (O E) 1) === 1
test-set-empty-different-key = refl

test-set-multiple-1 : count (set (set empty (O E) 1) (I E) 2) === 2
test-set-multiple-1 = refl

test-set-multiple-2 : count (set (set empty (O E) 1) (O E) 2) === 1
test-set-multiple-2 = refl

test-set-multiple-3 : count (set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3) === 3
test-set-multiple-3 = refl

test-set-multiple-4 : count (set (set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3) (I (I E)) 4) === 4
test-set-multiple-4 = refl

test-set-multiple-5 : count (set (set (set (set empty (O (I E)) 1) (I (O E)) 2) (O (O E)) 3) (O (I E)) 4) === 3
test-set-multiple-5 = refl
