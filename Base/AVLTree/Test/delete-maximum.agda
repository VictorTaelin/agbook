module Base.AVLTree.Test.delete-maximum where

open import Base.AVLTree.Balance.Balance
open import Base.AVLTree.Test.is-balanced
open import Base.AVLTree.AVLTree
open import Base.AVLTree.delete-maximum
open import Base.AVLTree.empty
open import Base.AVLTree.insert
open import Base.AVLTree.to-list
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Bool.or
open import Base.Equal.Equal
open import Base.List.List
open import Base.List.eq
open import Base.Maybe.Maybe
open import Base.Nat.Trait.Eq
open import Base.Nat.Trait.Ord
open import Base.Nat.Nat
open import Base.Nat.lt
open import Base.Pair.Pair
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.Trait.Ord
open import Base.Unit.Unit

-- Helper function to create a test tree
create-test-tree : AVLTree Nat Unit
create-test-tree =
  (10 , unit) ::> (2 , unit) ::> (8 , unit) ::> (6 , unit) ::> (4 , unit) ::>
   (9 , unit) ::> (1 , unit) ::> (7 , unit) ::> (3 , unit) ::> (5 , unit) ::> empty

-- Test 1: Deleting maximum from an empty tree
test-empty : (None , empty , False) ≡ delete-maximum {Nat} {Unit} empty
test-empty = refl

-- Test 2: Deleting maximum from a single-node tree
test-single-node : (Some (5 , unit) , empty , True) ≡ delete-maximum (Node (5 , unit) zero empty empty)
test-single-node = refl

-- Test 3: Deleting maximum from a larger tree
test-larger-tree : to-list (get-fst (get-snd (delete-maximum create-test-tree))) ≡
                   ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: (5 , unit) ::
                    (6 , unit) :: (7 , unit) :: (8 , unit) :: (9 , unit) :: [])
test-larger-tree = refl

-- Test 4: Checking the maximum value returned
test-max-value : Some (10 , unit) ≡ get-fst (delete-maximum create-test-tree)
test-max-value = refl

-- Test 5: Deleting maximum multiple times
test-multiple-delete : do
  let (_ , tree1 , _) = delete-maximum create-test-tree
  let (_ , tree2 , _) = delete-maximum tree1
  let (_ , tree3 , _) = delete-maximum tree2
  to-list tree3 ≡ ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) ::
                        (5 , unit) :: (6 , unit) :: (7 , unit) :: [])
test-multiple-delete = refl

-- Test 6: Checking if the tree remains balanced after deleting maximum
test-balanced-after-delete : True ≡ is-balanced (get-fst (get-snd (delete-maximum create-test-tree)))
test-balanced-after-delete = refl

-- Test 7: Checking if the tree remains balanced after multiple deletions
test-balanced-after-multiple-deletes : do
  let (_ , tree1 , _) = delete-maximum create-test-tree
  let (_ , tree2 , _) = delete-maximum tree1
  let (_ , tree3 , _) = delete-maximum tree2
  True ≡ (is-balanced tree1 && is-balanced tree2 && is-balanced tree3)
test-balanced-after-multiple-deletes = refl
