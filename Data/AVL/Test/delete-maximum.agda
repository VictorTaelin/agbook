module Data.AVL.Test.delete-maximum where

open import Data.AVL.Type
open import Data.AVL.insert
open import Data.AVL.delete-maximum
open import Data.AVL.to-list
open import Data.AVL.empty
open import Data.AVL.Balance.Type
open import Data.AVL.Test.is-balanced
open import Data.List.Type
open import Data.List.eq
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Nat.ord
open import Data.Equal.Type
open import Data.Pair.Type
open import Data.Maybe.Type
open import Data.Bool.Type
open import Data.Bool.or
open import Data.Bool.and
open import Data.Trait.Ord
open import Data.Nat.lt
open import Data.Unit.Type

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
test-larger-tree : to-list (Pair.fst (Pair.snd (delete-maximum create-test-tree))) ===
                   ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: (5 , unit) ::
                    (6 , unit) :: (7 , unit) :: (8 , unit) :: (9 , unit) :: [])
test-larger-tree = refl

-- Test 4: Checking the maximum value returned
test-max-value : Some (10 , unit) === Pair.fst (delete-maximum create-test-tree)
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
test-balanced-after-delete : True === is-balanced (Pair.fst (Pair.snd (delete-maximum create-test-tree)))
test-balanced-after-delete = refl

-- Test 7: Checking if the tree remains balanced after multiple deletions
test-balanced-after-multiple-deletes :
  let (_ , tree₁ , _) = delete-maximum create-test-tree
      (_ , tree₂ , _) = delete-maximum tree₁
      (_ , tree₃ , _) = delete-maximum tree₂
  in True === (is-balanced tree₁ && is-balanced tree₂ && is-balanced tree₃)
test-balanced-after-multiple-deletes = refl
