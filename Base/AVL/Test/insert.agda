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
open import Base.Unit.Type
open import Base.Pair.Type

-- Helper function to create a balanced tree
balanced-tree : AVL Nat Unit
balanced-tree = from-list ((3 , unit) :: (2 , unit) :: (4 , unit) :: [])

-- Test: Insert into an empty tree
test-insert-empty : insert (1 , unit) empty === Node (1 , unit) zero empty empty
test-insert-empty = refl

-- Test: Insert into a balanced tree (no rotation needed)
test-insert-no-rotation : insert (5 , unit) balanced-tree ===
  Node (3 , unit) +one (Node (2 , unit) zero empty empty) (Node (4 , unit) +one empty (Node (5 , unit) zero empty empty))
test-insert-no-rotation = refl

-- Test: Insert triggering a left rotation
test-insert-left-rotation : insert (5 , unit) (insert (6 , unit) balanced-tree) ===
  Node (3 , unit) +one (Node (2 , unit) zero empty empty) (Node (5 , unit) zero (Node (4 , unit) zero empty empty) (Node (6 , unit) zero empty empty))
test-insert-left-rotation = refl

-- Test: Insert triggering a right rotation
test-insert-right-rotation : insert (1 , unit) (insert (0 , unit) balanced-tree) ===
  Node (3 , unit) -one (Node (1 , unit) zero (Node (0 , unit) zero empty empty) (Node (2 , unit) zero empty empty)) (Node (4 , unit) zero empty empty)
test-insert-right-rotation = refl

-- Test: Inserting a duplicate value
test-insert-duplicate : insert (2 , unit) balanced-tree === balanced-tree
test-insert-duplicate = refl

-- Test: Check if the tree remains balanced after insertions
test-balanced-after-insertions : is-balanced (insert (6 , unit) (insert (5 , unit) (insert (4 , unit) (insert (0 , unit) balanced-tree)))) === True
test-balanced-after-insertions = refl
