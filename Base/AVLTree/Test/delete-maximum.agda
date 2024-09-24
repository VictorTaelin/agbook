module Base.AVLTree.Test.delete-maximum where

open import Base.AVLTree.Type
open import Base.AVLTree.insert
open import Base.AVLTree.delete-maximum
open import Base.AVLTree.to-list
open import Base.AVLTree.empty
open import Base.AVLTree.Balance.Type
open import Base.AVLTree.Test.is-balanced
open import Base.List.Type
open import Base.List.eq
open import Base.Nat.Type
open import Base.Nat.Trait.Eq
open import Base.Nat.Trait.Ord
open import Base.Equal.Type
open import Base.Pair.Type
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.Maybe.Type
open import Base.Bool.Type
open import Base.Bool.or
open import Base.Bool.and
open import Base.Trait.Ord
open import Base.Nat.lt
open import Base.Unit.Type

-- Helper function to create a test tree
create-test-tree : AVL Nat Unit
create-test-tree =
  (10 , unit) ::> (2 , unit) ::> (8 , unit) ::> (6 , unit) ::> (4 , unit) ::>
   (9 , unit) ::> (1 , unit) ::> (7 , unit) ::> (3 , unit) ::> (5 , unit) ::> empty

-- Test 1: Deleting maximum from an empty tree
test-empty : (None , empty , False) === delete-maximum {Nat} {Unit} empty
test-empty = refl

-- Test 2: Deleting maximum from a single-node tree
test-single-node : (Some (5 , unit) , empty , True) === delete-maximum (Node (5 , unit) zero empty empty)
test-single-node = refl

-- Test 3: Deleting maximum from a larger tree
test-larger-tree : to-list (get-fst (get-snd (delete-maximum create-test-tree))) ===
                   ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: (5 , unit) ::
                    (6 , unit) :: (7 , unit) :: (8 , unit) :: (9 , unit) :: [])
test-larger-tree = refl

-- Test 4: Checking the maximum value returned
test-max-value : Some (10 , unit) === get-fst (delete-maximum create-test-tree)
test-max-value = refl

-- Test 5: Deleting maximum multiple times
test-multiple-delete : 
  let (_ , tree₁ , _) = delete-maximum create-test-tree
      (_ , tree₂ , _) = delete-maximum tree₁
      (_ , tree₃ , _) = delete-maximum tree₂
  in to-list tree₃ === ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) ::
                        (5 , unit) :: (6 , unit) :: (7 , unit) :: [])
test-multiple-delete = refl

-- Test 6: Checking if the tree remains balanced after deleting maximum
test-balanced-after-delete : True === is-balanced (get-fst (get-snd (delete-maximum create-test-tree)))
test-balanced-after-delete = refl

-- Test 7: Checking if the tree remains balanced after multiple deletions
test-balanced-after-multiple-deletes :
  let (_ , tree₁ , _) = delete-maximum create-test-tree
      (_ , tree₂ , _) = delete-maximum tree₁
      (_ , tree₃ , _) = delete-maximum tree₂
  in True === (is-balanced tree₁ && is-balanced tree₂ && is-balanced tree₃)
test-balanced-after-multiple-deletes = refl
