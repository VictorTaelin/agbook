module Data.AVL.Test.delete where

open import Data.AVL.Type
open import Data.AVL.delete
open import Data.AVL.insert
open import Data.AVL.empty
open import Data.AVL.to-list
open import Data.AVL.Test.is-balanced
open import Data.Equal.Type
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Nat.ord
open import Data.List.Type
open import Data.List.eq

-- Test 1: Deleting from an empty tree
test-delete-empty : delete 5 empty === empty
test-delete-empty = refl

-- Test 2: Deleting a non-existent element
test-delete-non-existent : delete 5 (insert 3 empty) === insert 3 empty
test-delete-non-existent = refl

-- Test 3: Deleting the root of a single-element tree
test-delete-root-single : delete 3 (insert 3 empty) === empty
test-delete-root-single = refl

-- Test 4: Deleting from a balanced tree
test-delete-balanced : 
  let tree = insert 2 (insert 1 (insert 3 empty))
      result = delete 2 tree
  in (to-list result == to-list (insert 3 (insert 1 empty))) && is-balanced result === True
test-delete-balanced = refl

-- Test 5: Deleting causing a left rotation
test-delete-left-rotation :
  let tree = insert 4 (insert 3 (insert 2 (insert 1 empty)))
      result = delete 1 tree
  in is-balanced result === True
test-delete-left-rotation = refl

-- Test 6: Deleting causing a right rotation
test-delete-right-rotation :
  let tree = insert 1 (insert 2 (insert 3 (insert 4 empty)))
      result = delete 4 tree
  in is-balanced result === True
test-delete-right-rotation = refl

-- Test 7: Deleting from a larger tree
test-delete-larger-tree :
  let tree = insert 5 (insert 3 (insert 7 (insert 2 (insert 4 (insert 6 (insert 8 empty))))))
      result = delete 3 tree
  in is-balanced result && (to-list result == 2 :: 4 :: 5 :: 6 :: 7 :: 8 :: []) === True
test-delete-larger-tree = refl

-- Test 8: Multiple deletions
test-multiple-deletions :
  let tree = insert 5 (insert 3 (insert 7 (insert 2 (insert 4 (insert 6 (insert 8 empty))))))
      result = delete 4 (delete 7 (delete 2 tree))
  in is-balanced result && (to-list result == 3 :: 5 :: 6 :: 8 :: []) === True
test-multiple-deletions = refl

-- Test 9: Deleting all elements
test-delete-all :
  let tree = insert 3 (insert 2 (insert 1 empty))
      result = delete 2 (delete 3 (delete 1 tree))
  in result === empty
test-delete-all = refl

-- Test 10: Deleting and re-inserting
test-delete-reinsert :
  let tree = insert 3 (insert 2 (insert 1 empty))
      intermediate = delete 2 tree
      result = insert 2 intermediate
  in (to-list result == to-list tree) && is-balanced result === True
test-delete-reinsert = refl
