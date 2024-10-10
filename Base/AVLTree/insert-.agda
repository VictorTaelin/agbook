module Base.AVLTree.insert- where

open import Base.AVLTree.AVLTree
open import Base.AVLTree.insert
open import Base.AVLTree.empty
open import Base.AVLTree.from-list
open import Base.AVLTree.Balance.Balance
open import Base.AVLTree.is-balanced
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.Trait.Eq
open import Base.Nat.Trait.Ord
open import Base.List.List
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Unit.Unit
open import Base.Pair.Pair

-- Helper function to create a balanced tree
balanced-tree : AVLTree Nat Unit
balanced-tree = from-list ((3 , unit) :: (2 , unit) :: (4 , unit) :: [])

-- Test: Insert into an empty tree
test-insert-empty : insert (1 , unit) empty ≡ Node (1 , unit) zero empty empty
test-insert-empty = refl

-- Test: Insert into a balanced tree (no rotation needed)
test-insert-no-rotation : insert (5 , unit) balanced-tree ≡
  Node (3 , unit) +one (Node (2 , unit) zero empty empty) (Node (4 , unit) +one empty (Node (5 , unit) zero empty empty))
test-insert-no-rotation = refl

-- Test: Insert triggering a left rotation
test-insert-left-rotation : insert (5 , unit) (insert (6 , unit) balanced-tree) ≡
  Node (3 , unit) +one (Node (2 , unit) zero empty empty) (Node (5 , unit) zero (Node (4 , unit) zero empty empty) (Node (6 , unit) zero empty empty))
test-insert-left-rotation = refl

-- Test: Insert triggering a right rotation
test-insert-right-rotation : insert (1 , unit) (insert (0 , unit) balanced-tree) ≡
  Node (3 , unit) -one (Node (1 , unit) zero (Node (0 , unit) zero empty empty) (Node (2 , unit) zero empty empty)) (Node (4 , unit) zero empty empty)
test-insert-right-rotation = refl

-- Test: Inserting a duplicate value
test-insert-duplicate : insert (2 , unit) balanced-tree ≡ balanced-tree
test-insert-duplicate = refl

-- Test: Check if the tree remains balanced after insertions
test-balanced-after-insertions : is-balanced (insert (6 , unit) (insert (5 , unit) (insert (4 , unit) (insert (0 , unit) balanced-tree)))) ≡ True
test-balanced-after-insertions = refl

