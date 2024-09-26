module Base.AVLTree.Test.difference where

open import Base.AVLTree.AVLTree
open import Base.AVLTree.difference
open import Base.AVLTree.empty
open import Base.AVLTree.insert
open import Base.AVLTree.from-list
open import Base.AVLTree.to-list
open import Base.AVLTree.Test.is-balanced
open import Base.Equal.Equal
open import Base.Nat.Nat
open import Base.Nat.Trait.Eq
open import Base.Nat.Trait.Ord
open import Base.List.List
open import Base.List.Trait.Eq
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Unit.Unit
open import Base.Unit.Trait.Eq
open import Base.Pair.Pair
open import Base.Pair.Trait.Eq
open import Base.Trait.Eq

-- Helper function to create a tree
tree : List (Pair Nat Unit) → AVLTree Nat Unit
tree = from-list

-- Test 1: Difference of an empty tree with itself
test-empty-diff : difference (empty {K = Nat} {V = Unit}) empty ≡ empty
test-empty-diff = refl

-- Test 2: Difference of a non-empty tree with an empty tree
test-nonempty-empty-diff : do
  let t = tree ((1 , unit) :: (2 , unit) :: [])
  to-list (difference t empty) ≡ to-list t
test-nonempty-empty-diff = refl

-- Test 3: Difference of an empty tree with a non-empty tree
test-empty-nonempty-diff : do
  let t = tree ((1 , unit) :: (2 , unit) :: [])
  difference empty t ≡ empty
test-empty-nonempty-diff = refl

-- Test 4: Difference of two identical trees
test-identical-diff : do
  let t = tree ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
  difference t t ≡ empty
test-identical-diff = refl

-- Test 5: Difference of two disjoint trees
test-disjoint-diff : do
  let t1 = tree ((1 , unit) :: (2 , unit) :: [])
  let t2 = tree ((3 , unit) :: (4 , unit) :: [])
  to-list (difference t1 t2) ≡ to-list t1
test-disjoint-diff = refl

-- Test 6: Difference with partial overlap
test-partial-overlap-diff : do
  let t1 = tree ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
  let t2 = tree ((2 , unit) :: (3 , unit) :: (4 , unit) :: [])
  let result = difference t1 t2
  (to-list result == ((1 , unit) :: [])) && is-balanced result ≡ True
test-partial-overlap-diff = refl

-- Test 7: Difference with one tree being a subset of another
test-subset-diff : do
  let t1 = tree ((1 , unit) :: (2 , unit) :: (3 , unit) :: (4 , unit) :: [])
  let t2 = tree ((2 , unit) :: (3 , unit) :: [])
  let result = difference t1 t2
  (to-list result == ((1 , unit) :: (4 , unit) :: [])) && is-balanced result ≡ True
test-subset-diff = refl

-- Test 8: Difference of trees with repeated elements
test-repeated-elements-diff : do
  let t1 = tree ((1 , unit) :: (2 , unit) :: (2 , unit) :: (3 , unit) :: [])
  let t2 = tree ((2 , unit) :: (3 , unit) :: (3 , unit) :: [])
  let result = difference t1 t2
  (to-list result == ((1 , unit) :: [])) && is-balanced result ≡ True
test-repeated-elements-diff = refl

-- Test 9: Difference of larger trees
test-larger-trees-diff : do
  let t1 = tree ((1 , unit) :: (3 , unit) :: (5 , unit) :: (7 , unit) :: (9 , unit) :: [])
  let t2 = tree ((2 , unit) :: (3 , unit) :: (5 , unit) :: (8 , unit) :: [])
  let result = difference t1 t2
  (to-list result == ((1 , unit) :: (7 , unit) :: (9 , unit) :: [])) && is-balanced result ≡ True
test-larger-trees-diff = refl

-- Test 10: Difference using the infix operator
test-infix-operator : do
  let t1 = tree ((1 , unit) :: (2 , unit) :: (3 , unit) :: [])
  let t2 = tree ((2 , unit) :: (3 , unit) :: (4 , unit) :: [])
  let result = t1 ∖ t2
  (to-list result == ((1 , unit) :: [])) && is-balanced result ≡ True
test-infix-operator = refl
