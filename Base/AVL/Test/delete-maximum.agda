module Base.AVL.Test.delete-maximum where

open import Base.AVL.Type
open import Base.AVL.insert
open import Base.AVL.delete-maximum
open import Base.AVL.to-list
open import Base.AVL.empty
open import Base.AVL.Balance.Type
open import Base.AVL.Test.is-balanced
open import Base.List.Type
open import Base.List.eq
open import Base.Nat.Type
open import Base.Nat.eq
open import Base.Nat.Ord
open import Base.Equal.Type
open import Base.Pair.Type
open import Base.Maybe.Type
open import Base.Bool.Type
open import Base.Bool.or
open import Base.Bool.and
open import Base.Trait.Ord
open import Base.Nat.lt

-- Helper function to create a test tree
create-test-tree : AVL Nat
create-test-tree =
  10 ::> 2 ::> 8 ::> 6 ::> 4 ::> 9 ::> 1 ::> 7 ::> 3 ::> 5 ::> empty

-- Test 1: Deleting maximum from an empty tree
test-empty : ((empty , None) , False) === delete-maximum {Nat} empty
test-empty = refl

-- Test 2: Deleting maximum from a single-node tree
test-single-node : ((empty , Some 5) , True) === delete-maximum (Node 5 zero empty empty)
test-single-node = refl

-- Test 3: Deleting maximum from a larger tree
test-larger-tree : to-list (Pair.fst (Pair.fst (delete-maximum create-test-tree))) === (1 :: 2 :: 3 :: 4 :: 5 :: 6 :: 7 :: 8 :: 9 :: [])
test-larger-tree = refl

-- Test 4: Checking the maximum value returned
test-max-value : Some 10 === Pair.snd (Pair.fst (delete-maximum create-test-tree))
test-max-value = refl

-- Test 5: Deleting maximum multiple times
test-multiple-delete : 
  let tree₁ = Pair.fst (Pair.fst (delete-maximum create-test-tree))
      tree₂ = Pair.fst (Pair.fst (delete-maximum tree₁))
      tree₃ = Pair.fst (Pair.fst (delete-maximum tree₂))
  in to-list tree₃ === (1 :: 2 :: 3 :: 4 :: 5 :: 6 :: 7 :: [])
test-multiple-delete = refl

-- Test 6: Checking if the tree remains balanced after deleting maximum
test-balanced-after-delete : True === is-balanced (Pair.fst (Pair.fst (delete-maximum create-test-tree)))
test-balanced-after-delete = refl

-- Test 7: Checking if the tree remains balanced after multiple deletions
test-balanced-after-multiple-deletes :
  let tree₁ = Pair.fst (Pair.fst (delete-maximum create-test-tree))
      tree₂ = Pair.fst (Pair.fst (delete-maximum tree₁))
      tree₃ = Pair.fst (Pair.fst (delete-maximum tree₂))
  in True === (is-balanced tree₁ && is-balanced tree₂ && is-balanced tree₃)
test-balanced-after-multiple-deletes = refl
