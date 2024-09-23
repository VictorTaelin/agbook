module Base.TreeAVL.Test.intersect where

open import Base.TreeAVL.Type
open import Base.TreeAVL.intersect
open import Base.TreeAVL.insert
open import Base.TreeAVL.empty
open import Base.TreeAVL.from-list
open import Base.TreeAVL.to-list
open import Base.TreeAVL.Test.is-balanced
open import Base.Equal.Type
open import Base.Nat.Type
open import Base.Nat.Trait.Eq
open import Base.Nat.Trait.Ord
open import Base.List.Type
open import Base.List.eq
open import Base.List.sort
open import Base.Bool.Type
open import Base.Unit.Type
open import Base.Pair.Type
open import Base.Pair.get-fst

-- Helper function to create AVL trees from lists
tree-from : List (Pair Nat Unit) → AVL Nat Unit
tree-from = from-list

-- Test: Intersection of two empty trees
test-intersect-empty-empty : (empty ∩ empty) === empty {K = Nat} {V = Unit}
test-intersect-empty-empty = refl

-- Test: Intersection of an empty tree with a non-empty tree
test-intersect-empty-nonempty : (empty ∩ tree-from ((1 , unit) :: (2 , unit) :: [])) === empty {K = Nat} {V = Unit}
test-intersect-empty-nonempty = refl

-- Test: Intersection of a non-empty tree with an empty tree
test-intersect-nonempty-empty : (tree-from ((1 , unit) :: (2 , unit) :: []) ∩ empty) === empty {K = Nat} {V = Unit}
test-intersect-nonempty-empty = refl

-- Test: Intersection of two trees with no common elements
test-intersect-no-common : 
  to-list (tree-from ((1 , unit) :: (3 , unit) :: []) ∩ tree-from ((2 , unit) :: (4 , unit) :: [])) === []
test-intersect-no-common = refl

-- Test: Intersection of two trees with some common elements
test-intersect-some-common : 
  to-list (tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: []) ∩ tree-from ((2 , unit) :: (3 , unit) :: (4 , unit) :: [])) 
  === ((2 , unit) :: (3 , unit) :: [])
test-intersect-some-common = refl

-- Test: Intersection of two identical trees
test-intersect-identical : 
  let tree = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
  in to-list (tree ∩ tree) === to-list tree
test-intersect-identical = refl

-- Test: Intersection of two trees where one is a subset of the other
test-intersect-subset : 
  let tree1 = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: [])
      tree2 = tree-from ((2 , unit) :: (3 , unit) :: [])
  in to-list (tree1 ∩ tree2) === to-list tree2
test-intersect-subset = refl

-- Test: Intersection is commutative
test-intersect-commutative : 
  let tree1 = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
      tree2 = tree-from ((2 , unit) :: (3 , unit) :: (4 , unit) :: [])
  in to-list (tree1 ∩ tree2) === to-list (tree2 ∩ tree1)
test-intersect-commutative = refl

-- Test: Intersection with self is idempotent
test-intersect-idempotent : 
  let tree = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
  in to-list (tree ∩ tree) === to-list ((tree ∩ tree) ∩ tree)
test-intersect-idempotent = refl

-- Test: Intersection preserves balance
test-intersect-balanced : 
  let tree1 = tree-from ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: (5 , unit) :: [])
      tree2 = tree-from ((3 , unit) :: (4 , unit) :: (5 , unit) :: (6 , unit) :: (7 , unit) :: [])
  in is-balanced (tree1 ∩ tree2) === True
test-intersect-balanced = refl
