module Base.AVL.Test.insert where

open import Base.AVL.Type
open import Base.AVL.insert
open import Base.AVL.empty
open import Base.AVL.from-list
open import Base.AVL.Balance.Type
open import Base.AVL.Test.is-balanced
open import Base.Equal.Type
open import Base.Nat.Type
open import Base.Nat.eq
open import Base.Nat.Ord
open import Base.List.Type
open import Base.Bool.Type
open import Base.Bool.and

-- Helper function to create a balanced tree
balanced-tree : AVL Nat
balanced-tree = from-list (3 :: 2 :: 4 :: [])

-- Test: Insert into an empty tree
test-insert-empty : insert 1 empty === Node 1 zero empty empty
test-insert-empty = refl

-- Test: Insert into a balanced tree (no rotation needed)
test-insert-no-rotation : insert 5 balanced-tree ===
  Node 3 +one (Node 2 zero empty empty) (Node 4 +one empty (Node 5 zero empty empty))
test-insert-no-rotation = refl

-- Test: Insert triggering a left rotation
test-insert-left-rotation : insert 5 (insert 6 balanced-tree) ===
  Node 3 +one (Node 2 zero empty empty) (Node 5 zero (Node 4 zero empty empty) (Node 6 zero empty empty))
test-insert-left-rotation = refl

-- Test: Insert triggering a right rotation
test-insert-right-rotation : insert 1 (insert 0 balanced-tree) ===
  Node 3 -one (Node 1 zero (Node 0 zero empty empty) (Node 2 zero empty empty)) (Node 4 zero empty empty)
test-insert-right-rotation = refl

-- Test: Inserting a duplicate value
test-insert-duplicate : insert 2 balanced-tree === balanced-tree
test-insert-duplicate = refl

-- Test: Check if the tree remains balanced after insertions
test-balanced-after-insertions : is-balanced (insert 6 (insert 5 (insert 4 (insert 0 balanced-tree)))) === True
test-balanced-after-insertions = refl
