module Base.AVLTree.union- where

open import Base.AVLTree.AVLTree
open import Base.AVLTree.union
open import Base.AVLTree.insert
open import Base.AVLTree.empty
open import Base.AVLTree.from-list
open import Base.AVLTree.to-list
open import Base.AVLTree.is-balanced
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.Trait.Eq
open import Base.Nat.Trait.Ord
open import Base.List.List
open import Base.List.eq
open import Base.List.sort
open import Base.Bool.Bool
open import Base.Unit.Unit
open import Base.Pair.Pair
open import Base.Pair.get-fst

-- Helper function to create AVL trees from lists
tree-from : List (Pair Nat Unit) → AVLTree Nat Unit
tree-from = from-list

-- Test: Union of two empty trees
test-union-empty-empty : (empty ∪ empty) ≡ empty {K = Nat} {V = Unit}
test-union-empty-empty = refl

-- Test: Union of an empty tree with a non-empty tree
test-union-empty-nonempty :
  to-list (empty ∪ tree-from ((1 , unit) :: (2 , unit) :: [])) ≡ ((1 , unit) :: (2 , unit) :: [])
test-union-empty-nonempty = refl

-- Test: Union of a non-empty tree with an empty tree
test-union-nonempty-empty :
  to-list (tree-from ((1 , unit) :: (2 , unit) :: []) ∪ empty) ≡ ((1 , unit) :: (2 , unit) :: [])
test-union-nonempty-empty = refl

-- Test: Union of two trees with no common elements
test-union-no-common :
  to-list (tree-from ((1 , unit) :: (3 , unit) :: []) ∪ tree-from ((2 , unit) :: (4 , unit) :: []))
  ≡ ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: [])
test-union-no-common = refl

-- Test: Union of two trees with some common elements
test-union-some-common :
  to-list (tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: []) ∪ tree-from ((2 , unit) :: (3 , unit) :: (4 , unit) :: []))
  ≡ ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: [])
test-union-some-common = refl

-- Test: Union of two identical trees
test-union-identical :
  let tree = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
  in to-list (tree ∪ tree) ≡ to-list tree
test-union-identical = refl

-- Test: Union of two trees where one is a subset of the other
test-union-subset :
  let tree1 = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: [])
      tree2 = tree-from ((2 , unit) :: (3 , unit) :: [])
  in to-list (tree1 ∪ tree2) ≡ to-list tree1
test-union-subset = refl

-- Test: Union is commutative
test-union-commutative :
  let tree1 = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
      tree2 = tree-from ((2 , unit) :: (3 , unit) :: (4 , unit) :: [])
  in to-list (tree1 ∪ tree2) ≡ to-list (tree2 ∪ tree1)
test-union-commutative = refl

-- Test: Union with self is idempotent
test-union-idempotent :
  let tree = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
  in to-list (tree ∪ tree) ≡ to-list ((tree ∪ tree) ∪ tree)
test-union-idempotent = refl

-- Test: Union preserves balance
test-union-balanced :
  let tree1 = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: (5 , unit) :: [])
      tree2 = tree-from ((3 , unit) :: (4 , unit) :: (5 , unit) :: (6 , unit) :: (7 , unit) :: [])
  in is-balanced (tree1 ∪ tree2) ≡ True
test-union-balanced = refl

-- Test: Union with empty tree is identity
test-union-identity :
  let tree = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
  in (tree ∪ empty) ≡ tree
test-union-identity = refl

-- Test: Union is associative
test-union-associative :
  let tree1 = tree-from ((1 , unit) :: (2 , unit) :: [])
      tree2 = tree-from ((3 , unit) :: (4 , unit) :: [])
      tree3 = tree-from ((5 , unit) :: (6 , unit) :: [])
  in to-list ((tree1 ∪ tree2) ∪ tree3) ≡ to-list (tree1 ∪ (tree2 ∪ tree3))
test-union-associative = refl

-- Test: Union overwrites values from the first tree with values from the second tree
test-union-overwrite :
  let tree1 = tree-from ((1 , unit) :: (2 , unit) :: [])
      tree2 = tree-from ((2 , unit) :: (3 , unit) :: [])
  in to-list (tree1 ∪ tree2) ≡ ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
test-union-overwrite = refl

-- Test: Union of multiple trees
test-union-multiple :
  let tree1 = tree-from ((1 , unit) :: (2 , unit) :: [])
      tree2 = tree-from ((3 , unit) :: (4 , unit) :: [])
      tree3 = tree-from ((5 , unit) :: (6 , unit) :: [])
  in to-list (tree1 ∪ tree2 ∪ tree3) ≡ ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: (5 , unit) :: (6 , unit) :: [])
test-union-multiple = refl

