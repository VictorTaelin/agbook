module Base.AVLTree.Test.fold where

open import Base.AVLTree.Type
open import Base.AVLTree.empty
open import Base.AVLTree.fold
open import Base.AVLTree.from-list
open import Base.AVLTree.insert
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Bool.or
open import Base.Equal.Type
open import Base.List.Type
open import Base.Nat.Trait.Eq
open import Base.Nat.Trait.Ord
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Pair.Type
open import Base.Pair.get-fst
open import Base.Trait.Eq
open import Base.Trait.Ord
open import Base.Unit.Type

-- Helper function to create a test tree
test-tree : AVLTree Nat Unit
test-tree = from-list ((3 , unit) :: (2 , unit) :: (4 , unit) :: (1 , unit) :: (5 , unit) :: [])

-- Test: Fold on an empty tree
test-fold-empty : fold (λ (key , _) acc -> key + acc) 0 (empty {V = Unit}) ≡ 0
test-fold-empty = refl

-- Test: Fold to sum all keys in the tree
test-fold-sum : fold (λ p acc -> get-fst p + acc) 0 test-tree ≡ 15
test-fold-sum = refl

-- Test: Fold to count nodes in the tree
test-fold-count : fold (λ _ acc -> 1 + acc) 0 test-tree ≡ 5
test-fold-count = refl

-- Test: Fold to find maximum key in the tree
test-fold-max : fold (λ p acc -> if (get-fst p > acc) then get-fst p else acc) 0 test-tree ≡ 5
test-fold-max = refl

-- Test: Fold to find minimum key in the tree
test-fold-min : fold (λ p acc -> if (get-fst p < acc) then get-fst p else acc) 999 test-tree ≡ 1
test-fold-min = refl

-- Test: Fold to create a list of keys (in-order traversal)
test-fold-to-list : fold (λ p acc -> get-fst p :: acc) [] test-tree ≡ (5 :: 4 :: 3 :: 2 :: 1 :: [])
test-fold-to-list = refl

-- Test: Fold with a complex accumulator (pair of sum and count)
test-fold-complex : fold (λ p acc -> (get-fst p + get-fst acc , 1 + get-fst acc)) (0 , 0) test-tree ≡ (15 , 11)
test-fold-complex = refl

-- Test: Fold on a single-node tree
test-fold-single-node : fold (λ p acc -> get-fst p + acc) 0 (insert (7 , unit) empty) ≡ 7
test-fold-single-node = refl

-- Test: Fold with a function that ignores the tree elements
test-fold-constant : fold (λ _ _ -> 42) 0 test-tree ≡ 42
test-fold-constant = refl

-- Test: Fold to check if a specific key exists in the tree
test-fold-exists : fold (λ p acc -> acc || (get-fst p == 3)) False test-tree ≡ True
test-fold-exists = refl
